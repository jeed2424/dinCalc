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

}
