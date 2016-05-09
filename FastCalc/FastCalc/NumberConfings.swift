//
//  NumberConfings.swift
//  FastCalc
//
//  Created by Julian1 on 09.05.16.
//  Copyright © 2016 juliankob.com. All rights reserved.
//

import Foundation

extension Double {
    func formattedNumbers() -> String {
        let numberFormatter = NSNumberFormatter()
        numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        
        numberFormatter.locale = NSLocale.currentLocale()
        numberFormatter.stringFromNumber(self)!
        return numberFormatter.stringFromNumber(self)!
    }
}
