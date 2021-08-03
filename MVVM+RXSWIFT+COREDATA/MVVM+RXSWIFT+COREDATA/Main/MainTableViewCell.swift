//
//  MainTableViewCell.swift
//  MVVM+RXSWIFT+COREDATA
//
//  Created by Ted on 2021/08/03.
//

import UIKit

final class MainTableViewCell: UITableViewCell {
    
    //MARK: - UIMetrics
    
    private struct UI {
        static let baseMargin = CGFloat(20)
    }
    
    //MARK: - Properties
    
    private let nameLabel = UILabel()
    
    // MARK: - Initialize
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Configure Selection
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        accessoryType = selected ? .checkmark : .none
    }
    
    //MARK: - SetupUI
    
    private func setupUI() {
        nameLabel.font = .preferredFont(forTextStyle: .headline)
        contentView.addSubview(nameLabel)
    }
    
    private func setupConstraints() {
        nameLabel
            .topAnchor(to: contentView.topAnchor, constant: UI.baseMargin)
            .leadingAnchor(to: contentView.leadingAnchor, constant: UI.baseMargin)
            .bottomAnchor(to: contentView.bottomAnchor, constant: -UI.baseMargin)
            .trailingAnchor(to: contentView.trailingAnchor, constant: -UI.baseMargin)
            .activateAnchors()
    }
    
    //MARK: - Cell contents
    
    func configureWith(name: String, isChecked: UITableViewCell.AccessoryType) {
        nameLabel.text = name
        accessoryType = isChecked
    }
}
