//
//  Double+Ext.swift
//  dinCalc
//
//  Created by Jay on 2022-11-16.
//

import Foundation

extension Double {
    func forTrailingZero() -> String {
        var tempVar = String(format: "%g", self)
        return tempVar
    }
}
