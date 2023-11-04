//
//  InformationViewCell.swift
//  mandiri-ios
//
//  Created by Miftah Juanda Batubara on 02/11/23.
//

import UIKit

internal final class InformationViewCell: UITableViewCell {
    static let reusableId = "InformationViewCell"
    
    private lazy var information = StackView(.horizontal){
        adult
        duration
        voteAverage
        release
    }.setAlignment(.center)
        .setDistribution(.fillEqually)
        .setPadding(.init(top: 10, left: 20, bottom: 10, right: 20))
        .setSpacing(10)
    
    private var adult =  InformationComponent(icon: .icAdult)
    private var duration = InformationComponent(icon: .icDuration)
    private var voteAverage = InformationComponent()
    private var release = InformationComponent()
    private let spacer = SpacerView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUiCellInformation()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(information: DetailEntity) {
        adult.isHidden = !information.adult
        
        duration.setData(icon: .icDuration, title: information.runtime, desc: " ")
        voteAverage.setData(icon: .icStar, title: information.voteAverage, desc: information.voteCount)
        release.setData(icon: .icRelease, title: information.releaseDate.convertDateString() ?? "", desc: information.productionCountrie)
    }
    
    private func setUiCellInformation() {
        selectionStyle = .none
        contentView.backgroundColor = .ebonyClayColor
        
        contentView.addSubview(information)
        information.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
        
        contentView.addSubview(spacer)
        spacer.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalToSuperview()
        }
    }
}
