//
//  NewsTableViewCell.swift
//  MVVM+API
//
//  Created by Ted on 2021/09/10.
//

import UIKit

final class NewsTableViewCell: UITableViewCell {
    
    // MARK: - UI Metrics
    
    private struct UI {
        static let baseMargin = CGFloat(8)
    }
    
    // MARK: - Properties
    
    private let titleLabel = UILabel()
    private let dateLabel = UILabel()
    
    // MARK: - Initialize
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - setupUI
    
    private func setupUI() {
        titleLabel.lineBreakMode = .byTruncatingHead
        titleLabel.numberOfLines = 3
        titleLabel.font = .preferredFont(forTextStyle: .headline)
        
        dateLabel.font = .preferredFont(forTextStyle: .footnote)
        
        contentView.addSubviews([titleLabel, dateLabel])
    }
    
    private func setupConstraints() {
        titleLabel
            .topAnchor(to: contentView.topAnchor, constant: UI.baseMargin)
            .leadingAnchor(to: contentView.leadingAnchor, constant: UI.baseMargin)
            .trailingAnchor(to: contentView.trailingAnchor, constant: -UI.baseMargin)
            .activateAnchors()
        
        dateLabel
            .topAnchor(to: titleLabel.bottomAnchor, constant: UI.baseMargin)
            .leadingAnchor(to: titleLabel.leadingAnchor)
            .trailingAnchor(to: titleLabel.trailingAnchor)
            .bottomAnchor(to: contentView.bottomAnchor, constant: -UI.baseMargin)
            .activateAnchors()
    }
    
    // MARK: - Cell Contents
    
    func configureWith(title: String, date: String) {
        titleLabel.text = title
        dateLabel.text = date
    }
}

