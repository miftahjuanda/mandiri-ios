//
//  SpacerView.swift
//  mandiri-ios
//
//  Created by Miftah Juanda Batubara on 02/11/23.
//

import UIKit

internal final class SpacerView: UIView {
    
    init() {
        super.init(frame: .zero)
        
        setUISpacer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUISpacer() {
        backgroundColor = .tunaColor
        snp.makeConstraints { make in
            make.height.equalTo(1)
        }
    }
}
