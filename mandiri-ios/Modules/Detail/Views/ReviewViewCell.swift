//
//  ReviewViewCell.swift
//  mandiri-ios
//
//  Created by Miftah Juanda Batubara on 02/11/23.
//

import UIKit

internal final class ReviewViewCell: UITableViewCell {
    static let reusableId = "ReviewViewCell"
    
    private var image: ImageView = {
        let image = ImageView()
        image.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 47, height: 47))
        }
        image.image = .remove
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 47/2
        return image
    }()
    
    private let authorLabel = LabelView(font: .boldSystemFont(ofSize: 13))
    private let ratingLabel = LabelView(font: .systemFont(ofSize: 10, weight: .regular))
    private let reviewLabel = LabelView(font: .systemFont(ofSize: 10, weight: .regular))
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setData()
        setUiReviewCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData() {
        image.image = .actions
        authorLabel.text = "data.author"
        ratingLabel.text = "Rating: 7.4"
        reviewLabel.text = "data.content"
    }
    
    private func setUiReviewCell() {
        selectionStyle = .none
        contentView.backgroundColor = .tunaColor
        
        let authorDetailHStack = StackView {
            authorLabel
            ratingLabel
        }.setSpacing(2)
        
        let authorHStack = StackView(.horizontal) {
            image
            authorDetailHStack
        }.setAlignment(.center)
            .setDistribution(.fill)
            .setSpacing(5)
        
        reviewLabel.clipsToBounds = true
        let mainVStack = StackView {
            authorHStack
            reviewLabel
        }.setPadding(.init(top: 10, left: 15, bottom: 10, right: 15))
            .setSpacing(5)
        
        mainVStack.backgroundColor = .ebonyClayColor
        contentView.addSubview(mainVStack)
        mainVStack.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalTo(contentView).inset(1)
        }
        
        mainVStack.layoutIfNeeded()
    }
}
