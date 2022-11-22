//
//  UIStackView+Ext.swift
//  dinCalc
//
//  Created by Jay on 2022-11-16.
//

import Foundation
import UIKit

extension UIStackView {
    public func addArrangedSubviews(_ views: [UIView]) {
      views.forEach { addArrangedSubview($0) }
    }
}
