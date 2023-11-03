//
//  TableviewCell+Ext.swift
//  mandiri-ios
//
//  Created by Miftah Juanda Batubara on 03/11/23.
//

import UIKit

extension UITableViewCell {
    func animateSelection(_ finish: @escaping () -> Void) {
        UIView.animate(withDuration: 0.2) {
            self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95) // Scale down the cell
        } completion: { _ in
            UIView.animate(withDuration: 0.2) {
                self.transform = .identity
                finish()
            }
        }
    }
}
