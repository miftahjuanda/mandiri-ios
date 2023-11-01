//
//  GenreViewCell.swift
//  mandiri-ios
//
//  Created by Miftah Juanda Batubara on 01/11/23.
//

import UIKit

internal final class GenreViewCell: UITableViewCell {
    static let reusableId = "GenreViewCell"
    
    // MARK: - Properties
    private lazy var mainHstack: StackView = {
        let stack = StackView(.horizontal) {
            titleLabel
            iconCevronRight
        }.setSpacing(10)
            .setPadding(.init(top: 12, left: 14, bottom: 12, right: 14))
        stack.backgroundColor = .colorEbony
        stack.layer.cornerRadius = 8
        return stack
    }()
    
    private let titleLabel = LabelView(textColor: .athensColor,
                                       font: .systemFont(ofSize: 16, weight: .semibold))
    private let iconCevronRight: ImageView = {
        let image = ImageView(UIImage(systemName: "chevron.right"))
        image.contentMode = .center
        image.tintColor = .athensColor
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUIGenreCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bindData(title: String) {
        self.titleLabel.text = title
    }
    
    private func setUIGenreCell() {
        selectionStyle = .none
        backgroundColor = .clear
        
        iconCevronRight.snp.makeConstraints { make in
            make.width.equalTo(24)
        }
        
        contentView.addSubview(mainHstack)
        mainHstack.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.top.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview()
        }
        
    }
}
