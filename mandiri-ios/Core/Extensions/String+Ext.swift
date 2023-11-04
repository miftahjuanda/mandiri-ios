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
    
    func calculateTime() -> String {
        let timeMeasure = Measurement(value: Double(self) ?? 10.0, unit: UnitDuration.minutes)
        let hours = timeMeasure.converted(to: .hours)
        if hours.value > 1 {
            let minutes = timeMeasure.value.truncatingRemainder(dividingBy: 60)
            return String(format: "%.f %@ %.f %@", hours.value, "h", minutes, "m")
        }
        return String(format: "%.f %@", timeMeasure.value, "m")
    }
    
    func formatVoteNumber() -> String {
        let number = Int(self) ?? 0
        let numberFormatter = NumberFormatter()
        
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 1
        
        if number >= 1000 {
            let scaledNumber = Double(number) / 1000.0
            let formattedNumber = numberFormatter.string(from: NSNumber(value: scaledNumber))
            let resultString = "\(formattedNumber ?? "")K"
            return resultString
        } else if number >= 1000000 {
            let scaledNumber = Double(number) / 1000000.0
            let formattedNumber = numberFormatter.string(from: NSNumber(value: scaledNumber))
            let resultString = "\(formattedNumber ?? "")M"
            return resultString
        } else {
            let formattedNumber = numberFormatter.string(from: NSNumber(value: number))
            return formattedNumber ?? "-"
        }
    }
}
