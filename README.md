# Usage

A typical use case for this library is to write on a database images, their variants and overlays, galleries, their subgalleries, the images they contain and their search tokens,
in a controlled fashion. This library enforces the soft constraints expressed in [ZTronDataModel](https://github.com/NiccoloBargioni/ZTronDataModel) under Sources > ZTronDataModel > Tables. 

The serialization, from the perspective of the client of this code, follows a bottom-up approach: images (and their properties) exist first, then galleries of images. The suggested approach
is to serialize (ie invoke `write(to db: Connection)` or `writeIfNotExists(to db: Connection)`) only on objects of type `SerializableGalleryRouter`, instead of manually serialize individual elements.

Each gallery is a `ZTronRouter<Empty, SerializableImageNode, SerializableImageNode.NavigationParameters>` in the sense of [ZTronRouter](https://github.com/NiccoloBargioni/ZTronRouter). You programmatically create a new gallery instantiating an object of this type (initially empty and pointed to `[">"]` by default). 
You can add an image to this gallery by invoking 

```
let gallery = ZTronRouter<Empty, SerializableImageNode, SerializableImageNode.NavigationParameters>()

gallery.register(
  SerializableImageNode(
        name: "the name of the image in assets.xcassets",
        description: "The ID of the LocalizedStringKeys in localized files",
        position: The incremental position of the image in the gallery,
        searchLabel: "can use this field to specify a different string to use during search instead of description. Can be nil",
        overlays: = [] // [any SerializableOverlayNode], all the available overlays for an image
  ),
  at: ["this should be a valid image name"] 
)
```

Then when all the gallery are loaded with all the images they needs to contain, you can create a `SerializableGalleryRouter` object, whose responsibility is to 
automate serialization of a collection of galleries and their images. This still works when there's a single gallery to serialize, so that edge case should still be handled this way.

An example code of how to type it the following: 

```
let galleriesRouter: SerializableGalleryRouter = SerializableGalleryRouter()

// make some gallery and fill it with its images as described above.

galleriesRouter.register(someGallery, at: ["name of the gallery1 on db"])
// register other galleries if needed

do {
        try DBMS.transaction(#function) { dbConnection in
            
            let galleryFK = SerializableGalleryForeignKeys(
                tool: "tool name on db",
                tab: "tab name on db",
                map: "map name on db",
                game: "game name on db"
            )
            
            try galleriesRouter.writeIfNotExists(db: dbConnection, with: galleryFK, propagate: true)
            
            return .commit
        }
    } catch {
        fatalError(error.localizedDescription)
    }
```

When `propagate` is set to `true`, the node is recursively written on the database, therefore all of its images, and variants, are serialized. `writeIfNotExists` first checks if the content to serialize was already written on the db,
and desists to serialize if so, avoiding attempts to write records with the same primary key (which results in an exception), at the cost of more complexity. 


## Keep in mind

### Naming conventions

This library uses the path of the images inside gallery routers to infer master->variant relationships between images, therefore the path components should match the name of actual images on the database, as well as it uses the path to establish the name of the variant. 

For instance, consider the following registration code snippet:

```
let puppetStringsGallery = ZTronRouter<Empty, SerializableImageNode, SerializableImageNode.NavigationParameters>() 

// Register master
puppetStringsGallery.register(
  SerializableImageNode(
    name: "upNAtoms",
    description: "Behind the Up 'n Atoms perk machine, outside of the spawn building.",
    position: 0,
    overlays: [SerializableBoundingCircleOverlay()]
  ),
  at: ["upNAtoms"] 
)


// Register variant: 

puppetStringsGallery.register(
  SerializableImageNode(
    name: "upNAtomsNoRave",
    description: "Behind the Up 'n Atoms perk machine, outside of the spawn building.",
    position: 0,
    overlays: [SerializableBoundingCircleOverlay()]
  ),
  at: ["upNAtoms", "NoRave"],
  withParameter: SerializableImageNode.NavigationParameters(
      bottomBarIcon: "image for no rave icon (usually systemName)",
      boundingFrame: CGRect.NORMALIZED_FULL_SIZE (or any normalized CGRect representing what part of the original image the variant represents"
  )
)
```

In this scenario, this library infers that there exists an image in `assets.xcassets` named `upNAtoms` and another one named `upNAtomsNoRave`, and that `upNAtomsNoRave` is the "NoRave" variant of `upNAtoms`. This is due to the specified path, not due to the naming of the images.
Mismatching casing (or id) between path and name property will result in failure, that is "upNAtoms" must be typed the same both at the registration time (as an image name), and at the time it is used as a master for a variant (in the path).


### Rules not enforced at compile-time

As of 12.10.2024, `SerializableImageNode` constructor should have a non-null `withParameter` parameter when the path has more than two components, so that every variant of an image has an associated icon and region on screen it represents. Failing to comply will result in a runtime error, causing the app to crash. 
