//
//  UIComponents.swift
//  dinCalc
//
//  Created by Jay on 2022-11-16.
//

import Foundation
import UIKit

class UIComponents {
    // MARK: - UI Components
    lazy var genderLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false

        label.text = "Gender"
        label.textAlignment = .center
        label.backgroundColor = .systemCyan
        label.layer.cornerRadius = 10

        return label
    }()

    lazy var shoeLocaleLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false

        label.text = "Boot Locale"
        label.textAlignment = .center
        label.backgroundColor = .systemCyan
        label.layer.cornerRadius = 10

        return label
    }()

    lazy var levelLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false

        label.text = "Skiing Level"
        label.textAlignment = .center
        label.backgroundColor = .systemCyan
        label.layer.cornerRadius = 10

        return label
    }()

    lazy var shoeSizeLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false

        label.text = "Shoe Size"
        label.textAlignment = .center
        label.backgroundColor = .systemCyan
        label.layer.cornerRadius = 10

        return label
    }()

    lazy var bootSizeTopLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false

        label.text = "Boot Size"
        label.textAlignment = .center
        label.backgroundColor = .systemCyan
        label.layer.cornerRadius = 10

        return label
    }()

    lazy var bootSizeLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false

        label.text = ""
        label.textAlignment = .center
        label.backgroundColor = .systemCyan
        label.layer.cornerRadius = 10

        return label
    }()

    lazy var genderBtn: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false

        button.setTitle("Gender", for: .normal)
        button.backgroundColor = .systemCyan
        button.layer.cornerRadius = 10

        return button
    }()

    lazy var shoeLocaleBtn: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false

        button.setTitle("Locale", for: .normal)
        button.backgroundColor = .systemCyan
        button.layer.cornerRadius = 10

        return button
    }()

    lazy var skiLevelBtn: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false

        button.setTitle("Level", for: .normal)
        button.backgroundColor = .systemCyan
        button.layer.cornerRadius = 10

        return button
    }()

    lazy var shoeSizeBtn: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false

        button.setTitle("Size", for: .normal)
        button.backgroundColor = .systemCyan
        button.layer.cornerRadius = 10

        return button
    }()

    lazy var heightLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false

        label.text = "Height"
        label.textAlignment = .center
        label.backgroundColor = .systemCyan
        label.layer.cornerRadius = 10

        return label
    }()

    lazy var weightLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false

        label.text = "Weight"
        label.textAlignment = .center
        label.backgroundColor = .systemCyan
        label.layer.cornerRadius = 10

        return label
    }()

    lazy var skiLengthLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false

        label.text = ""
        label.textAlignment = .center
        label.backgroundColor = .systemCyan
        label.layer.cornerRadius = 10

        return label
    }()

    lazy var skiLengthTopLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false

        label.text = "Ski Length"
        label.textAlignment = .center
        label.backgroundColor = .systemCyan
        label.layer.cornerRadius = 10

        return label
    }()

    lazy var informationsBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false

        btn.setImage(UIImage(systemName: "info.circle"), for: .normal)

        return btn
    }()

    lazy var dinTopLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false

        label.text = "Din"
        label.textAlignment = .center
        label.backgroundColor = .systemCyan
        label.layer.cornerRadius = 10

        return label
    }()

    lazy var dinLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false

        label.text = ""
        label.textAlignment = .center
        // label.backgroundColor = .systemCyan
        label.layer.cornerRadius = 10

        return label
    }()

}
