//
//  LabelView.swift
//  mandiri-ios
//
//  Created by Miftah Juanda Batubara on 01/11/23.
//

import UIKit

internal class LabelView: UILabel {
    private var padding: UIEdgeInsets = .zero
    
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
    
    public override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: padding))
    }
    
    public override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + self.padding.left + self.padding.right,
                      height: size.height + self.padding.top + self.padding.bottom)
    }
    
    func setPadding(_ padding: UIEdgeInsets) -> LabelView {
        self.padding = padding
        self.clipsToBounds = true
        return self
    }
}
