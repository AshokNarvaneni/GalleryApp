//
//  CoreDataViewModel.swift
//  GalleryApp
//
//  Created by Ashok Narvaneni on 17/04/24.
//

import Foundation
import CoreData



class CoreDataViewModel {
    
    private var managedObjectContext: NSManagedObjectContext
    let instance = CoreDataManager.sharedInstanceCoreData
    
    init(managedObjectContext: NSManagedObjectContext) {
        self.managedObjectContext = managedObjectContext
    }
    
    
    func addProductToEntity(product: Products) {
        
        let newProduct = NSEntityDescription.insertNewObject(forEntityName: instance.productEntity, into: CoreDataManager.sharedInstanceCoreData.managedObjectContext) as! ProductsEntity
        newProduct.title = product.title
        newProduct.imageUrl = product.imageUrl
        newProduct.price = Double(product.price)
        newProduct.ratingCount = Int32(product.rating?.count ?? 0)
        newProduct.type = product.category
        
        CoreDataManager.sharedInstanceCoreData.saveContextData()
    }
    
    func updateValueInProductEntity(entity: ProductsEntity, newTitle:String) {
        entity.title = newTitle
        CoreDataManager.sharedInstanceCoreData.saveContextData()
    }
    
    func deleteProductEntity(entity: ProductsEntity) {
        managedObjectContext.delete(entity)
        CoreDataManager.sharedInstanceCoreData.saveContextData()
    }
    
    func fetchProductEntitiesData() -> [ProductsEntity] {
        let fetchRequest = ProductsEntity.fetchRequest()
        do {
            let productsArray: [ProductsEntity] = try managedObjectContext.fetch(fetchRequest)
            return productsArray
        } catch let error {
            print("Fetch request failed:", error.localizedDescription)
            return []
        }
    }
    
    func saveDataToCoreData(products: [Products]) {
        
        DispatchQueue.global().async { [self] in
            for product in products {
                let entity = NSEntityDescription.insertNewObject(forEntityName: instance.productEntity, into: managedObjectContext) as? ProductsEntity
                entity?.title = product.title
                entity?.imageUrl = product.imageUrl
                entity?.price = Double(product.price)
                entity?.ratingCount = Int32(product.rating?.count ?? 0)
                entity?.type = product.category
            }
            self.instance.saveContextData()
        }
    }
    
}
