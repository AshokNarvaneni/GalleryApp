//
//  CoreDataManager.swift
//  GalleryApp
//
//  Created by Ashok Narvaneni on 17/04/24.
//

import Foundation
import CoreData


class CoreDataManager: NSObject {
    
    let productEntity = "ProductsEntity"
    
    static let sharedInstanceCoreData = CoreDataManager()
    
    // Get the Persistent Container from the CoreData
    lazy var container: NSPersistentContainer = {
        let  persistentContainer = NSPersistentContainer(name: productEntity)
        persistentContainer.loadPersistentStores { storeDescription, error in
            if let error = error {
                print("Failed to fetch the Persistent Container: ", error.localizedDescription)
            }
        }
        return persistentContainer
    }()
    
    // Get the Managed Object Context from container to perform the add, delete and other operations.
    var managedObjectContext: NSManagedObjectContext {
        return container.viewContext
    }
    
    // When ever we do some operations(add/delete), need to call the below function to save those changes in CoreDta
    func saveContextData() {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch let error {
                print("Handle the error:", error.localizedDescription)
            }
        }
    }
}
