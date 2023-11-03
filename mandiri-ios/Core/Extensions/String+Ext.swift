//
//  String+Ext.swift
//  mandiri-ios
//
//  Created by Miftah Juanda Batubara on 03/11/23.
//

import Foundation

extension String {
    func convertDateString() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.locale = Locale(identifier: "id_ID")
        
        if let date = dateFormatter.date(from: self) {
            dateFormatter.dateFormat = "MMM d yyyy"
            return dateFormatter.string(from: date)
        } else {
            return nil
        }
    }
}
