//
//  MainViewController.swift
//  MVVM+RXSWIFT+API
//
//  Created by Ted on 2021/07/31.
//

import UIKit
import RxCocoa
import RxDataSources
import RxSwift

final class NewsViewController: UIViewController, ViewType {
    
    //MARK: UI Metrics
    
    private struct UI {
        static let baseMargin = CGFloat(8)
        static let tableViewFrame = UIScreen.main.bounds
        static let estimatedRowHeight = CGFloat(80)
    }
    
    //MARK: - Properties
    
    var viewModel: NewsViewModelType!
    var disposeBag: DisposeBag!
    private let tableView = UITableView(frame: UI.tableViewFrame, style: .plain)
    private let indicatorView = UIActivityIndicatorView(style: .large)
    
    //MARK: setupUI
    
    func setupUI() {
        navigationItem.title = "RxNews"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: nil, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: nil, action: nil)
        
    }
    
    //MARK: Rx Event Binding
    
    func setupEventBinding() {

    }
    
    //MARK: Rx UI Binding
    
    func setupUIBinding() {
        
    }
}
