//
//  ListTableViewCell.swift
//  VIPER+TDD+COREDATA
//
//  Created by Ted on 2021/07/29.
//

import UIKit

protocol ListTableViewCellProtocol: AnyObject {
    func configureWith(name: String, isChecked: UITableViewCell.AccessoryType)
}

class ListTableViewCell: UITableViewCell, ListTableViewCellProtocol {
    
    private struct UI {
        static let baseMargin = CGFloat(20)
    }
    
    //MARK: - Properties
    
    private let nameLabel = UILabel()
    
    //MARK: - Initialize
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Configure Selection
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        accessoryType = selected ? .checkmark : .none
    }
    
    //MARK: - ConfigureUI
    
    private func configureUI() {
        nameLabel.font = .preferredFont(forTextStyle: .headline)
        contentView.addSubview(nameLabel)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: UI.baseMargin).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: UI.baseMargin).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -UI.baseMargin).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -UI.baseMargin).isActive = true
    }
    
    //MARK: - Cell Contents / ListTableViewCellProtocol
    
    func configureWith(name: String, isChecked: UITableViewCell.AccessoryType) {
        nameLabel.text = name
        accessoryType = isChecked
    }
}


