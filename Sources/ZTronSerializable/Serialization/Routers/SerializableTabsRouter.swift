import Foundation
import SQLite
import ZTronDataModel
import ZTronRouter
import os

public final class SerializableTabsRouter: SerializableNode {
    private static let logger: os.Logger = .init(subsystem: "ZTronSerializable", category: "SerializableTabsRouter")
    public let router: ZTronRouter<Empty, SerializableTabNode, Empty>
    
    public init() {
        self.router = .init()
    }
    
    
    public func writeTo(db: SQLite.Connection, with foreignKeys: any SerializableForeignKeys, shouldValidateFK: Bool) throws {
        guard let foreignKeys = foreignKeys as? SerializableTabForeignKeys else {
            throw SerializableException.illegalArgumentException(
                reason: "foreignKeys expected to be of type \(String(describing: SerializableTabForeignKeys.self)) in \(#function) on type \(#file)"
            )
        }
        
        if shouldValidateFK {
            let firstInvalidFK = try foreignKeys.validate(on: db)
            
            if let firstInvalidFK = firstInvalidFK {
                throw SerializableException.invalidForeignKeyException(reason: firstInvalidFK)
            }
        }
        
        if self.router.getMaxDepth() <= 0 {
            #if DEBUG
            Self.logger.info("Attempted to serialize empty tools router for \(self.toString()).")
            #endif
            return
        }
        
        // Router should have depth 2
        if router.getMaxDepth() > 2 {
            throw SerializableException.illegalArgumentException(
                reason: "At the time of coding, tabs with slave tabs are not allowed in \(self.toString()). Consider checking logic in \(self.toString())"
            )
        }

        
        let tabsPositions = router.map { _, output in
            return output.getPosition()
        }
        
        if !Validator.validatePositions(tabsPositions) {
            throw SerializableException.validationException(
                reason: "Tabs positions \(String(describing: tabsPositions)) are not valid in \(#file) -> \(#function) for tab \(self.toString())"
            )
        }
        
        try self.router.forEach { _, output in
            try output.writeTo(db: db, with: foreignKeys, shouldValidateFK: shouldValidateFK)
        }
    }
    
    public func existsOn(db: SQLite.Connection, with foreignKeys: any SerializableForeignKeys, propagate: Bool) throws -> Bool {
        guard let foreignKeys = foreignKeys as? SerializableTabForeignKeys else {
            throw SerializableException.illegalArgumentException(
                reason: "foreignKeys expected to be of type \(String(describing: SerializableTabForeignKeys.self)) in \(#function) on type \(#file)"
            )
        }

        
        let allTabs = self.router.map { _, output in
            return output
        }
        
        for tab in allTabs {
            if !(try tab.existsOn(db: db, with: foreignKeys, propagate: propagate)) {
                return false
            }
        }
        
        #if DEBUG
        Self.logger.info("Tabs router \(self.toString()) exists on db")
        #endif
        
        return true
    }
    
    public func toString() -> String {
        var description: String = ""
        
        self.router.forEach { absolutePath, output in
            description += output.toString()
        }
        
        return description
    }
    
    public func deleteDanglingReferencesOn(db: SQLite.Connection, with foreignKeys: any SerializableForeignKeys, propagate: Bool) throws {
        print("DELETING \(String(describing: Self.self))")

        guard let foreignKeys = foreignKeys as? SerializableTabForeignKeys else {
            throw SerializableException.illegalArgumentException(
                reason: "Expected foreignKeys of type \(String(describing: SerializableTabForeignKeys.self)) in \(#file) -> \(#function)"
            )
        }

        if self.router.getMaxDepth() > 2 {
            throw SerializableException.validationException(
                reason: "Tabs with slave tabs are unsupported in \(#file) -> \(#function) for map \(self.toString())"
            )
        }
        
        if propagate {
            try self.router.forEach { absolutePath, output in
                try output.deleteDanglingReferencesOn(db: db, with: foreignKeys, propagate: propagate)
            }
        }


        var tabs: [String: SerializableTabNode] = [:]
        
        self.router.forEach { absolutePath, tabNode in
            tabs[tabNode.getName()] = tabNode
        }
        
        try DBMS.CRUD.batchDeleteTabsForMap(
            for: db,
            map: foreignKeys.getMap(),
            game: foreignKeys.getGame(),
            shouldRemove: { tabModel in
                return tabs[tabModel.getName()] == nil
            },
            shouldDecreasePositions: false
        )
    }
    
    
    public func updateOn(db: SQLite.Connection, with foreignKeys: any SerializableForeignKeys, propagate: Bool) throws {
        guard let foreignKeys = foreignKeys as? SerializableTabForeignKeys else {
            throw SerializableException.illegalArgumentException(
                reason: "Expected foreignKeys of type \(String(describing: SerializableTabForeignKeys.self)) in \(#file) -> \(#function)"
            )
        }

        if self.router.getMaxDepth() > 2 {
            throw SerializableException.validationException(
                reason: "Tabs with slave tabs are unsupported in \(#file) -> \(#function) for map \(self.toString())"
            )
        }
        
        if propagate {
            try self.router.forEach { absolutePath, output in
                try output.updateOn(db: db, with: foreignKeys, propagate: propagate)
            }
        }


        var tabs: [String: SerializableTabNode] = [:]
        
        self.router.forEach { absolutePath, tabNode in
            tabs[tabNode.getName()] = tabNode
        }
        
        try DBMS.CRUD.updateTabsForMap(
            for: db,
            game: foreignKeys.getGame(),
            map: foreignKeys.getMap()) { tabDraft in
                if let tab = tabs[tabDraft.getName()] {
                    tabDraft
                        .withUpdatedPosition(tab.getPosition())
                }
            } validate: { tabs in
                return Validator.validatePositions(tabs.map({ tabModel in
                    return tabModel.getPosition()
                }))
            }

    }

}
