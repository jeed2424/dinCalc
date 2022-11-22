//
//  UIView+Ext.swift
//  dinCalc
//
//  Created by Jay on 2022-11-14.
//

import Foundation
import UIKit

extension UIView {
//  public func addSubviews(_ subviews: UIView...) {
//    subviews.forEach(addSubview)
//  }

  public func addSubviews(_ views: [UIView]) {
    views.forEach { addSubview($0) }
  }
}
