//
//  ViewController.swift
//  dinCalc
//
//  Created by Jay on 2022-11-14.
//

import UIKit
import Combine
import DropDown

class ViewController: UIViewController {

    // MARK: - UI Components
    private lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false

        stack.alignment = .center
        stack.axis = .vertical
        stack.spacing = 5

        return stack
    }()

    private lazy var settingsMainStack1: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false

        stack.alignment = .center
        stack.axis = .horizontal
        stack.spacing = 20

        return stack
    }()

    private lazy var settingsGenderStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false

        stack.alignment = .center
        stack.axis = .vertical
        stack.spacing = 10

        return stack
    }()

    private lazy var settingsBootStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false

        stack.alignment = .center
        stack.axis = .vertical
        stack.spacing = 10

        return stack
    }()

    private lazy var settingsMainStack2: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false

        stack.alignment = .center
        stack.axis = .horizontal
        stack.spacing = 10

        return stack
    }()

    private lazy var bootsMainStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false

        stack.alignment = .center
        stack.axis = .horizontal
        stack.spacing = 20

        return stack
    }()

    private lazy var shoesStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false

        stack.alignment = .center
        stack.axis = .vertical
        stack.spacing = 10

        return stack
    }()

    private lazy var bootsStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false

        stack.alignment = .center
        stack.axis = .vertical
        stack.spacing = 10

        return stack
    }()

    private lazy var heightMainStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false

        stack.alignment = .center
        stack.axis = .horizontal
        stack.spacing = 20

        return stack
    }()

    private lazy var heightStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false

        stack.alignment = .center
        stack.axis = .vertical
        stack.spacing = 10

        return stack
    }()

    private lazy var skiHeightStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false

        stack.alignment = .center
        stack.axis = .vertical
        stack.spacing = 10

        return stack
    }()

    private lazy var dinLblStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false

        stack.alignment = .center
        stack.axis = .horizontal
        stack.spacing = 10

        return stack
    }()

    private lazy var dinStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false

        stack.alignment = .center
        stack.axis = .horizontal
        stack.spacing = 10

        return stack
    }()

    private lazy var heightCentimetersTextField: UITextField = {
        let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false

        txt.placeholder = "Height"
        txt.keyboardType = .numberPad

        txt.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)

        return txt
    }()


    // MARK: - Variables
    var gender: String = ""
    var bootLocale: String = ""
    var bootSize: String = ""
    private var subscriptions = Set<AnyCancellable>()

    // MARK: - Constants
    let viewModel = MainViewModel()
    let sizeManager = SizeManager()
    let genderDropDown = DropDown()
    let sizeLocaleDropDown = DropDown()
    let bootSizeDropDown = DropDown()

    let uiComps = UIComponents()

    let fakeHeight = "200"

    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        setupMainStack()
        setupSettingsStacks()
        setupShoesStacks()
        setupHeightStacks()
    }

    private func bindViewModel() {
        viewModel.$skiLength
            .receiveOnMain()
            .sink{ [weak self] skiLength in
                guard let self = self else { return }
                if self.view.subviews.contains(self.mainStack) && self.mainStack.subviews.contains(self.heightMainStack) {
                    self.uiComps.skiLengthLbl.text = skiLength
                    print(skiLength)
                }
            }.store(in: &subscriptions)
    }

    private func setupMainStack() {
        self.view.addSubview(mainStack)

        NSLayoutConstraint.activate([
            mainStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: -5),
            mainStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 5),
            mainStack.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 5)
           // mainStack.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }

    private func setupSettingsStacks() {
        guard self.view.subviews.contains(mainStack) else { return }

        let genderLbl = uiComps.genderLbl
        let genderBtn = uiComps.genderBtn
        let shoeLocaleLbl = uiComps.shoeLocaleLbl
        let shoeLocaleBtn = uiComps.shoeLocaleBtn


        mainStack.addArrangedSubview(settingsMainStack1)

        settingsMainStack1.addArrangedSubviews([settingsGenderStack, settingsBootStack])

        settingsGenderStack.addArrangedSubviews([genderLbl, genderBtn])

        settingsBootStack.addArrangedSubviews([shoeLocaleLbl, shoeLocaleBtn])

        mainStack.setCustomSpacing(20, after: settingsMainStack1)

        genderBtn.addTarget(self, action: #selector(openGender(_:)), for: .touchUpInside)
        shoeLocaleBtn.addTarget(self, action: #selector(openLocale(_:)), for: .touchUpInside)
    }

    private func setupShoesStacks() {
        guard self.view.subviews.contains(mainStack) else { return }

        let shoeSizeLbl = uiComps.shoeSizeLbl
        let shoeSizeBtn = uiComps.shoeSizeBtn
        let bootSizeTopLbl = uiComps.bootSizeTopLbl
        let bootSizeLbl = uiComps.bootSizeLbl

        mainStack.addArrangedSubview(bootsMainStack)

        bootsMainStack.addArrangedSubviews([shoesStack, bootsStack])

        shoesStack.addArrangedSubviews([shoeSizeLbl, shoeSizeBtn])

        bootsStack.addArrangedSubviews([bootSizeTopLbl, bootSizeLbl])

        NSLayoutConstraint.activate([
            bootSizeLbl.heightAnchor.constraint(equalTo: shoeSizeBtn.heightAnchor)
        ])

        mainStack.setCustomSpacing(20, after: bootsStack)

        shoeSizeBtn.addTarget(self, action: #selector(openSizing(_:)), for: .touchUpInside)
    }

    private func setupHeightStacks() {
        guard self.view.subviews.contains(mainStack) else { return }

        let heightLbl = uiComps.heightLbl
        let skiLengthTopLbl = uiComps.skiLengthTopLbl
        let skiLengthLbl = uiComps.skiLengthLbl
        let bootSizeLbl = uiComps.bootSizeLbl

        mainStack.addArrangedSubview(heightMainStack)

        heightMainStack.addArrangedSubviews([heightStack, skiHeightStack])

        heightStack.addArrangedSubviews([heightLbl, heightCentimetersTextField])

        skiHeightStack.addArrangedSubviews([skiLengthTopLbl, skiLengthLbl])
        // heightLbl.text = fakeHeight

        NSLayoutConstraint.activate([
            skiLengthLbl.heightAnchor.constraint(equalTo: heightCentimetersTextField.heightAnchor)
        ])

 //       mainStack.setCustomSpacing(20, after: bootsStack)

     //   shoeSizeBtn.addTarget(self, action: #selector(openSizing(_:)), for: .touchUpInside)
    }
}

// MARK: - Actions
extension ViewController {
    @objc func textFieldDidChange(_ textField: UITextField) {
        if textField == heightCentimetersTextField {
            self.viewModel.calculateSkiLength(centimeters: Double(textField.text ?? "0"))
        }
    }

    @objc func openGender(_ sender: UIButton) {

        genderDropDown.dataSource = sizeManager.genderArray
        genderDropDown.anchorView = sender
        genderDropDown.bottomOffset = CGPoint(x: 0, y: sender.frame.size.height)
        genderDropDown.show()
        genderDropDown.selectionAction = { [weak self] (index: Int, item: String) in
            guard let self = self else { return }
            sender.setTitle(item, for: .normal)
            self.gender = item

            self.refreshBootData()
        }

    }

    @objc func openLocale(_ sender: UIButton) {

        sizeLocaleDropDown.dataSource = sizeManager.bootSizeLocaleArray
        sizeLocaleDropDown.anchorView = sender
        sizeLocaleDropDown.bottomOffset = CGPoint(x: 0, y: sender.frame.size.height)
        sizeLocaleDropDown.show()
        sizeLocaleDropDown.selectionAction = { [weak self] (index: Int, item: String) in
            guard let self = self else { return }
            sender.setTitle(item, for: .normal)
            self.bootLocale = item

            self.refreshBootData()
        }

    }

    @objc func openSizing(_ sender: UIButton) {

        if bootLocale == "EU" {
            bootSizeDropDown.dataSource = sizeManager.euBootSizeArray
        } else if bootLocale == "US" {
            bootSizeDropDown.dataSource = sizeManager.usBootSizeArray
        }
        bootSizeDropDown.anchorView = sender
        bootSizeDropDown.bottomOffset = CGPoint(x: 0, y: sender.frame.size.height)
        bootSizeDropDown.show()
        bootSizeDropDown.selectionAction = { [weak self] (index: Int, item: String) in
            guard let self = self else { return }
            sender.setTitle(item, for: .normal)
            self.bootSize = item

            self.refreshBootData()
        }

    }
}

// MARK: - Functions
extension ViewController {

    private func refreshBootData() {
        guard !gender.isEmpty && !bootLocale.isEmpty && !bootSize.isEmpty else { return }

        self.uiComps.bootSizeLbl.text = viewModel.getMonSize(locale: self.bootLocale, gender: self.gender, size: self.bootSize)
        
        self.uiComps.bootSizeLbl.isHidden = false
    }

}

