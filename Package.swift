// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ZTronSerializable",
    platforms: [
        .macOS(.v11),
        .iOS(.v14)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ZTronSerializable",
            targets: ["ZTronSerializable"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/NickTheFreak97/SwiftGraph", branch: "msa"
        ),
        // Dependencies declare other packages that this package depends on.
        .package(
            url: "https://github.com/NiccoloBargioni/ZTronDataModel", branch: "main"
        ),
        .package(
            url: "https://github.com/NiccoloBargioni/ZTronRouter", branch: "main"
        ),
        .package(
            url: "https://github.com/stephencelis/SQLite.swift.git", from: "0.15.3"
        )
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "ZTronSerializable",
            dependencies: [
                .product(name: "SwiftGraph", package: "SwiftGraph"),
                .product(name: "ZTronDataModel", package: "ZTronDataModel"),
                .product(name: "ZTronRouter", package: "ZTronRouter"),
                .product(name: "SQLite", package: "SQLite.swift")
            ],
            swiftSettings: [
                .enableExperimentalFeature("StrictConcurrency=complete")
            ]
        ),
        .testTarget(
            name: "ZTronSerializableTests",
            dependencies: ["ZTronSerializable"]
        ),
    ]
)
