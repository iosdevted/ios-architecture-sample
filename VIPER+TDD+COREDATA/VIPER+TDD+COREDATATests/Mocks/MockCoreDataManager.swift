//
//  MockCoreDataManager.swift
//  VIPER+TDD+COREDATATests
//
//  Created by Ted on 2021/07/28.
//

import Foundation
@testable import VIPER_TDD_COREDATA

class MockCoreDataManager: CoreDataManager {
    var data: [String: Any]?
    var saveContextCalled = 0
    var createCalled = 0
    var updateCalled = 0
    
    var stubNil = false
    
    override func saveContext() {
        self.saveContextCalled += 1
        super.saveContext()
    }
    
    override func create<T>(ofType type: T.Type, withData data: [String : Any]?) -> T? where T : CoreDataProtocol {
        self.data = data
        self.createCalled += 1
        
        if stubNil {
            return nil
        }
        
        return super.create(ofType: type, withData: data)
    }
    
    override func update<T>(entity: T, withData data: [String : Any]) where T : CoreDataProtocol {
        self.data = data
        self.updateCalled += 1
        super.update(entity: entity, withData: data)
    }
}
