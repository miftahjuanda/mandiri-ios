//
//  LabelView.swift
//  mandiri-ios
//
//  Created by Miftah Juanda Batubara on 01/11/23.
//

import UIKit

internal class LabelView: UILabel {
    
    init(_ text: String = "",
         textColor: UIColor = .athensColor,
         alignment: NSTextAlignment = .natural,
         lines: Int = 0,
         font: UIFont = .systemFont(ofSize: 12, weight: .regular)) {
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.text = text
        self.numberOfLines = lines
        self.textColor = textColor
        self.textAlignment = alignment
        self.font = font
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
