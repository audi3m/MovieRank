//
//  Extensions.swift
//  MovieRank
//
//  Created by J Oh on 6/7/24.
//

import UIKit

extension UITableViewCell {
    static var id: String {
        String(describing: self)
    }
}

extension UIViewController {
    static var id: String {
        String(describing: self)
    }
}

extension Date {
    static var yesterday: Date {
        Calendar.current.date(byAdding: .day, value: -1, to: Date())!
    }
    
    var stringFormat: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        
        return formatter.string(from: self)
    }
}

