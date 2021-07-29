//
//  CoreDataService.swift
//  VIPER+TDD+COREDATA
//
//  Created by Ted on 2021/07/28.
//

import Foundation
import CoreData

protocol CoreDataProtocol {
    static func entityName() -> String
    
    static func create(withData data: [String: Any]?, context: NSManagedObjectContext) -> CoreDataProtocol?
    
    func update(withData data: [String: Any])
}

extension Todo: CoreDataProtocol {
    static func entityName() -> String {
        return "Todo"
    }
    
    static func create(withData data: [String : Any]?, context: NSManagedObjectContext) -> CoreDataProtocol? {
        guard let todo = NSEntityDescription.insertNewObject(forEntityName: Todo.entityName(), into: context) as? Todo else { return nil }
        
        if let data = data {
            todo.update(withData: data)
        }
        
        return todo
    }
    
    func update(withData data: [String : Any]) {
        for (_, keyValue) in data.enumerated() {
            guard let key = TodoKey(rawValue: keyValue.key) else { return }
            
            switch key {
            case .id:
                guard let value = keyValue.value as? String else { return }
                self.id = value
            case .title:
                guard let value = keyValue.value as? String else { return }
                self.title = value
            case .completed:
                guard let value = keyValue.value as? Bool else { return }
                self.completed = value
            }
        }
    }
}
