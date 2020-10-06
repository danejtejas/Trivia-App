//
//  DateExtension.swift
//  Trivia App
//
//  Created by Tejas on 06/10/20.
//  Copyright © 2020 Tejas. All rights reserved.
//

import Foundation


extension Date {
    
    func myFormate() -> String {
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.amSymbol = "am"
        dateFormatterGet.pmSymbol = "pm"
        dateFormatterGet.dateFormat = "MMM h:mm a"
        
        let mh =  dateFormatterGet.string(from: self)
        
        dateFormatterGet.dateFormat = "d"
        let dayString = dateFormatterGet.string(from: self)
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .ordinal
        
        // Add the suffix to the day
        let dayNumber = NSNumber(value: Int(dayString)!)
        let day = numberFormatter.string(from: dayNumber)!
        
        return "\(day) \(mh)"
    }
    
}
