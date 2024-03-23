//
//  DecimalUtils.swift
//  Banky
//
//  Created by Admin on 3/9/24.
//
import UIKit

extension Decimal {
    var doubleValue: Double {
        return  NSDecimalNumber(decimal: self).doubleValue
    }
}
