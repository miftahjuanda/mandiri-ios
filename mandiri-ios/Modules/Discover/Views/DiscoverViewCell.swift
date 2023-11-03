//
//  DiscoverViewCell.swift
//  mandiri-ios
//
//  Created by Miftah Juanda Batubara on 01/11/23.
//

import UIKit

internal final class DiscoverViewCell: UICollectionViewCell {
    static let reusableId = "DiscoverViewCell"
    
    // MARK: - Properties
    private lazy var mainVStack: StackView = {
        let stack = StackView {
            image
            titlelabel
            rateHStack
            datelabel
        }.setSpacing(2)
            .setPadding(.init(top: 8, left: 8, bottom: 8, right: 8))
        stack.backgroundColor = .ebonyColor
        stack.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        stack.layer.cornerRadius = 22
        return stack
    }()
    private let image: ImageView = {
        let image = ImageView()
        image.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        image.layer.cornerRadius = 14
        image.image = .icDataEmpty
        return image
    }()
    private let titlelabel = LabelView("Name moview", lines: 1,
                                       font: .systemFont(ofSize: 13,
                                                         weight: .medium))
    private let datelabel = LabelView("Nov 17 2023",lines: 1,
                                      font: .systemFont(ofSize: 10,
                                                        weight: .regular))
    
    private let rateLabel = LabelView("5.6", lines: 1,
                                      font: .systemFont(ofSize: 10,
                                                        weight: .regular))
    private let iconRate: ImageView = {
        let image = ImageView(.icStar)
        image.snp.makeConstraints { make in
            make.size.lessThanOrEqualTo(16)
        }
        image.contentMode = .scaleAspectFit
        return image
    }()
    private lazy var rateHStack = StackView(.horizontal) {
        iconRate
        rateLabel
    }.setSpacing(2)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUICell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(_ discover: Discover) {
        image.imageWithUrl(with: discover.posterUrl)
        titlelabel.text = discover.title
        datelabel.text = discover.releaseDate
        rateLabel.text = discover.voteAverage
    }
    
    private func setUICell() {
        backgroundColor = .clear
        
        titlelabel.snp.makeConstraints { make in
            make.height.equalTo(16)
        }
        rateHStack.snp.makeConstraints { make in
            make.height.equalTo(14)
        }
        datelabel.snp.makeConstraints { make in
            make.height.equalTo(12)
        }
        
        contentView.addSubview(mainVStack)
        mainVStack.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
        
        mainVStack.setCustomSpacing(8, after: mainVStack.subviews[0])
        mainVStack.layoutIfNeeded()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        image.sd_cancelCurrentImageLoad()
    }
}
