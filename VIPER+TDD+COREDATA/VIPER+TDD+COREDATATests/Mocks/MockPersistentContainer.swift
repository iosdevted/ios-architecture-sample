//
//  MockPersistentContainer.swift
//  VIPER+TDD+COREDATATests
//
//  Created by Ted on 2021/07/28.
//

import CoreData

class MockPersistentContainer {
    lazy var container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "VIPER_TDD_COREDATA")
        let description = NSPersistentStoreDescription()
        description.type = NSInMemoryStoreType
        description.shouldAddStoreAsynchronously = false
        
        container.persistentStoreDescriptions = [description]
        container.loadPersistentStores { description, error in
            precondition(description.type == NSInMemoryStoreType)
            if let error = error {
                fatalError("Create an in-mem coordinator failed \(error)")
            }
        }
        return container
    }()
}
