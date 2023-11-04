//
//  DescriptionViewCell.swift
//  mandiri-ios
//
//  Created by Miftah Juanda Batubara on 02/11/23.
//

import UIKit

internal final class DescriptionViewCell: UITableViewCell {
    static let reusableId = "DescriptionViewCell"
    
    private lazy var mainVStack = StackView {
        genreLabel
        descriptionLabel
    }.setSpacing(25)
        .setPadding(.init(top: 10, left: 15, bottom: 25, right: 15))
        .setAlignment(.leading)
        .setDistribution(.fillProportionally)
    
    private let spacer = SpacerView()
    
    private let genreLabel: LabelView = {
        let label = LabelView(font: .systemFont(ofSize: 13, weight: .regular))
            .setPadding(.init(top: 4, left: 8, bottom: 4, right: 8))
        label.backgroundColor = .tunaColor
        label.layer.cornerRadius = 8
        return label
    }()
    
    private let descriptionLabel = LabelView().setPadding(.init(top: 1, left: 0, bottom: 1, right: 0))
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUiDescription()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(genre: String, description: String) {
        descriptionLabel.text = description
        genreLabel.text = genre
    }
    
    private func setUiDescription() {
        selectionStyle = .none
        contentView.backgroundColor = .ebonyClayColor
        
        contentView.addSubview(mainVStack)
        mainVStack.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(1)
        }
        
        mainVStack.addSubview(spacer)
        spacer.snp.makeConstraints { make in
            make.leading.trailing.equalTo(contentView)
            make.top.equalTo(genreLabel.snp.bottom).offset(11)
        }
        
        mainVStack.layoutIfNeeded()
    }
}
