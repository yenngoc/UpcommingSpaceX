//
//  String+Ext.swift
//  DemoSpaceX
//
//  Created by Y on 10/09/2022.
//

import Foundation

extension String {
    func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
    
    func toDate(format: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.date(from: self)
    }
    
    
    func formateDate(from formatDate: String, to formatString: String) -> String? {
        let date = self.toDate(format: formatDate)
        if let date = date {
            let formatter = DateFormatter()
            formatter.dateFormat = formatString
            return formatter.string(from: date)
        }
        return nil
        
    }
    
    func UTCToLocal(_ inputformat: String, outputFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = inputformat
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")

        let dt = dateFormatter.date(from: self)
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = outputFormat

        return dateFormatter.string(from: dt!)
    }
}

