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
    private lazy var legendView: LegendView = {
        let view = LegendView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray.withAlphaComponent(0.85)

        let gesture = UITapGestureRecognizer(target: self, action: #selector(openLegend))

        view.addGestureRecognizer(gesture)

        view.isUserInteractionEnabled = true

        return view
    }()

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

    private lazy var settingsLevelStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false

        stack.alignment = .center
        stack.axis = .vertical
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

    private lazy var dinStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false

        stack.alignment = .center
        stack.axis = .vertical
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
    var skiLevel: String = ""
    var bootSize: String = ""
    var dinLbl = UILabel()
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
        self.dinLbl = uiComps.dinLbl
        bindViewModel()
        setupLegendBtn()
        setupMainStack()
        setupSettingsStacks()
        setupShoesStacks()
        setupHeightStacks()
        setupDinStacks()

        addGestures()
    }

    private func bindViewModel() {
        viewModel.$skiLength
            .receiveOnMain()
            .sink{ [weak self] skiLength in
                guard let self = self else { return }
                if self.view.subviews.contains(self.mainStack) && self.mainStack.subviews.contains(self.heightMainStack) {
                    self.uiComps.skiLengthLbl.text = skiLength
                }
            }.store(in: &subscriptions)

        viewModel.$dinValue
            .receiveOnMain()
            .sink { [weak self] dinValue in
                guard let self = self else { return }
                self.dinLbl.text = dinValue
            }.store(in: &subscriptions)
    }

    private func setupLegendBtn() {
        let informationBtn = uiComps.informationsBtn

        self.view.addSubview(informationBtn)

        NSLayoutConstraint.activate([
            informationBtn.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            informationBtn.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 5)
        ])

        NSLayoutConstraint.activate([
            informationBtn.widthAnchor.constraint(equalToConstant: 24),
            informationBtn.heightAnchor.constraint(equalToConstant: 24)
        ])

        informationBtn.addTarget(self, action: #selector(openLegend), for: .touchUpInside)

    }

    private func setupMainStack() {
        self.view.addSubview(mainStack)

        NSLayoutConstraint.activate([
            mainStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: -5),
            mainStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 5),
            mainStack.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 24)
           // mainStack.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }

    private func setupSettingsStacks() {
        guard self.view.subviews.contains(mainStack) else { return }

        let genderLbl = uiComps.genderLbl
        let genderBtn = uiComps.genderBtn
        let shoeLocaleLbl = uiComps.shoeLocaleLbl
        let shoeLocaleBtn = uiComps.shoeLocaleBtn

        let skiLevelLbl = uiComps.levelLbl
        let skiLevelBtn = uiComps.skiLevelBtn


        mainStack.addArrangedSubview(settingsMainStack1)

        settingsMainStack1.addArrangedSubviews([settingsGenderStack, settingsBootStack])

        settingsGenderStack.addArrangedSubviews([genderLbl, genderBtn])

        settingsBootStack.addArrangedSubviews([shoeLocaleLbl, shoeLocaleBtn])

        mainStack.addArrangedSubview(settingsMainStack2)

        settingsMainStack2.addArrangedSubview(settingsLevelStack)

        settingsLevelStack.addArrangedSubviews([skiLevelLbl, skiLevelBtn])

        mainStack.setCustomSpacing(20, after: settingsMainStack2)

        genderBtn.addTarget(self, action: #selector(openGender(_:)), for: .touchUpInside)
        shoeLocaleBtn.addTarget(self, action: #selector(openLocale(_:)), for: .touchUpInside)
        skiLevelBtn.addTarget(self, action: #selector(openSkiLevel(_:)), for: .touchUpInside)
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

        NSLayoutConstraint.activate([
            skiLengthLbl.heightAnchor.constraint(equalTo: heightCentimetersTextField.heightAnchor)
        ])
    }

    private func setupDinStacks() {
        guard self.view.subviews.contains(mainStack) else { return }

        let dinTopLbl = uiComps.dinTopLbl

        mainStack.addArrangedSubview(dinStack)

        dinStack.addArrangedSubviews([dinTopLbl, dinLbl])

      //  heightStack.addArrangedSubviews([heightLbl, heightCentimetersTextField])

      //  skiHeightStack.addArrangedSubviews([skiLengthTopLbl, skiLengthLbl])

//        NSLayoutConstraint.activate([
//            skiLengthLbl.heightAnchor.constraint(equalTo: heightCentimetersTextField.heightAnchor)
//        ])
    }

    private func addGestures() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(removeKeyboard))

        self.view.addGestureRecognizer(tap)
    }
}

// MARK: - Actions
extension ViewController {

    @objc func removeKeyboard() {
        self.hideKeyboard()
    }

    @objc func textFieldDidChange(_ textField: UITextField) {
        if textField == heightCentimetersTextField {
            self.viewModel.calculateSkiLength(centimeters: Double(textField.text ?? "0"))
        }
    }

    @objc func openLegend() {
        print("Open Legend")

        guard !self.view.subviews.contains(legendView) else {
            legendView.removeFromSuperview()
            return
        }
        self.view.addSubview(legendView)

        NSLayoutConstraint.activate([
            legendView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50),
            legendView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50),
            legendView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 25)
        ])
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

    @objc func openSkiLevel(_ sender: UIButton) {

        genderDropDown.dataSource = sizeManager.skiLevelArray
        genderDropDown.anchorView = sender
        genderDropDown.bottomOffset = CGPoint(x: 0, y: sender.frame.size.height)
        genderDropDown.show()
        genderDropDown.selectionAction = { [weak self] (index: Int, item: String) in
            guard let self = self else { return }
            sender.setTitle(item, for: .normal)
            self.skiLevel = item
            self.viewModel.skiLevel = item
            print("SkiLevel: \(self.viewModel.skiLevel)")

            // self.refreshBootData()
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

