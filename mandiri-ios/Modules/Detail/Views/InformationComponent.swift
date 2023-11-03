//
//  InformationComponent.swift
//  mandiri-ios
//
//  Created by Miftah Juanda Batubara on 02/11/23.
//

import UIKit

final internal class InformationComponent: UIStackView {
    private let icon: ImageView = {
        let icon = ImageView()
        icon.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: 16, height: 16))
        }
        icon.contentMode = .scaleAspectFill
        icon.clipsToBounds = true
        return icon
    }()
    
    private let titleLabel = LabelView(alignment: .center, lines: 1, font: .systemFont(ofSize: 11, weight: .regular))
    private let descLabel = LabelView(alignment: .center, lines: 1, font: .systemFont(ofSize: 9, weight: .regular))
    
    init(icon: UIImage = .icStar, title: String = "  ", desc: String = "  ") {
        super.init(frame: .zero)
        
        setData(icon: icon , title: title, desc: desc)
        setUIComponent()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        self.removeFromSuperview()
    }
    
    func setData(icon: UIImage, title: String, desc: String) {
        self.icon.image = icon
        self.titleLabel.text = title
        self.descLabel.text = desc
    }
    
    private func setUIComponent() {
        self.axis = .vertical
        self.spacing = 7
        self.alignment = .center
        [icon, titleLabel, descLabel].forEach { view in
            self.addArrangedSubview(view)
        }
    }
}
