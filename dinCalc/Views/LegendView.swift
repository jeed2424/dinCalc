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

    private lazy var exitBtn: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false

        button.setImage(UIImage(systemName: "x.circle"), for: .normal)
        button.addTarget(self, action: #selector(exitView), for: .touchUpInside)

        return button
    }()

    private lazy var vStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false

        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 10

        return stack
    }()

    private lazy var notesLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false

        label.numberOfLines = 0
        label.text = "This app is in ALPHA.\nChild sizes are not yet supported\nand there might be other bugs.\nHeight is in CM only for now."
        label.textAlignment = .center

        return label
    }()

    private lazy var levelsLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false

        label.text = "Levels"

        return label
    }()

    private lazy var levelOneLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false

        label.text = "1: Beginner"

        return label
    }()

    private lazy var levelTwoLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false

        label.text = "2: Intermediate"

        return label
    }()

    private lazy var levelThreeLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false

        label.text = "3: Expert"

        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupConstraints() {
        self.addSubview(vStack)

        NSLayoutConstraint.activate([
            vStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            vStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            vStack.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            vStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])

        vStack.addArrangedSubviews([notesLbl, levelsLbl, levelOneLbl, levelTwoLbl, levelThreeLbl])

        vStack.setCustomSpacing(20, after: notesLbl)

        vStack.setCustomSpacing(5, after: levelsLbl)

    }
}

extension LegendView {
    @objc private func exitView() {
        exitPassThrough.send()
    }
}
