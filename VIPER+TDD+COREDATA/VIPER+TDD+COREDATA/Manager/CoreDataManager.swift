//
//  CoreDataManager.swift
//  VIPER+TDD+COREDATA
//
//  Created by Ted on 2021/07/28.
//

import Foundation
import CoreData

class CoreDataManager: NSObject {
    
    let persistentContainer: NSPersistentContainer
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    init(persistentContainer: NSPersistentContainer) {
        self.persistentContainer = persistentContainer
        super.init()
    }
    
    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
                print("Data Saved to Context")
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func deleteAllData(_ entityName: String) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        fetchRequest.returnsObjectsAsFaults = false
        
        do {
            let results = try context.fetch(fetchRequest)
            for object in results {
                guard let objectData = object as? NSManagedObject else { return }
                debugPrint("Deleting: \(objectData)")
                context.delete(objectData)
            }
        } catch let error {
            fatalError("Deleting data \(entityName) error: \(error.localizedDescription)")
        }
    }
    
    //MARK: - Entity
    
    func create<T: CoreDataProtocol>(ofType type: T.Type, withData data: [String: Any]?) -> T? {
        let newEntity = T.create(withData: data, context: context)
        
        return newEntity as? T
    }
    
    func update<T: CoreDataProtocol>(entity: T, withData data: [String: Any]) {
        entity.update(withData: data)
    }
    
    func fetch<T: CoreDataProtocol>(ofType: T.Type, withPredicate predicate: NSPredicate? = nil, sortDescriptors: [NSSortDescriptor]? = nil) -> [T] {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: T.entityName())
        
        request.returnsObjectsAsFaults = false
        request.predicate = predicate
        request.sortDescriptors = sortDescriptors
        
        var entities = [T]()
        do {
            let fetchResult = try context.fetch(request)
            
            for data in fetchResult {
                if let entity = data as? T {
                    entities.append(entity)
                }
            }
        } catch let error {
            fatalError("error: \(error.localizedDescription)")
        }
        
        return entities
    }
    
}
