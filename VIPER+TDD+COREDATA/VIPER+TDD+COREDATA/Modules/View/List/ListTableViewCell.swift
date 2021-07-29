//
//  ListTableViewCell.swift
//  VIPER+TDD+COREDATA
//
//  Created by Ted on 2021/07/29.
//

import UIKit

protocol ListTableViewCellType {
    func configureWith(name: String, isChecked: UITableViewCell.AccessoryType)
}

final class ListTableViewCell: UITableViewCell, ListTableViewCellType {
    
    //MARK: - Properties
    
    private let nameLabel = UILabel()
    
    //MARK: - Initialize
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        accessoryType = selected ? .checkmark : .none
    }
    
    private func setupUI() {
        nameLabel.font = .preferredFont(forTextStyle: .headline)
        contentView.addSubview(nameLabel)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: contentView.topAnchor, constant: -10).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
    }
    
    //MARK: - Cell Contents
    
    func configureWith(name: String, isChecked: UITableViewCell.AccessoryType) {
        nameLabel.text = name
        accessoryType = isChecked
    }
    
}


