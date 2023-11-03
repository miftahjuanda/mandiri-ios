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
    
    private var adult =  InformationComponent(icon: .icAdult, title: "Adult")
    private var duration = InformationComponent(icon: .icDuration, title: "1h 56m")
    private var voteAverage = InformationComponent(title: "7.3/10", desc: "2.5K Review")
    private var release = InformationComponent(icon: .icRelease, title: "Nov 23 2020", desc: "US")
    private let spacer = SpacerView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUiCellInformation()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
