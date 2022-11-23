//
//  File.swift
//  dinCalc
//
//  Created by Jay on 2022-11-23.
//

import Foundation
import UIKit
import Combine

class LegendView: UIView {
    var exitPassThrough = PassthroughSubject<Void, Never>()

    private lazy var vStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false

        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 10

        return stack
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupConstraints() {

    }
}
