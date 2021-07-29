//
//  MockListView.swift
//  VIPER+TDD+COREDATATests
//
//  Created by Ted on 2021/07/29.
//

import Foundation
@testable import VIPER_TDD_COREDATA

class MockListView: ListViewController {
    var MockListCalled = 0

    override func reloadTableView() {
        self.MockListCalled += 1
    }
}
