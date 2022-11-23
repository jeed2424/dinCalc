//
//  UIViewController+Ext.swift
//  dinCalc
//
//  Created by Jay on 2022-11-22.
//

import Foundation
import UIKit

extension UIViewController {
    func hideKeyboard() {
        self.view.endEditing(true)
    }
}
