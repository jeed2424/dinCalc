//
//  MainViewModel.swift
//  dinCalc
//
//  Created by Jay on 2022-11-17.
//

import Foundation
import Combine

class MainViewModel: ObservableObject {
    
    let sizeManager = SizeManager()
    let dinCalculator = DinCalculator()

    @Published var genderArray: [String]
    @Published var bootSizeLocaleArray: [String]
    @Published var euBootSizeArray: [String]
    @Published var usBootSizeArray: [String]
    @Published var skiLength: String?
    @Published var dinValue: String = ""

    var skiLevel = "" {
        didSet {
            getDin()
        }
    }

    private var bootValue: String = "" {
        didSet {
            getDin()
        }
    }
    private var heightValue: String = "" {
        didSet {
            getDin()
        }
    }
    var weightValue: String = "" {
        didSet {
            getDin()
        }
    }
    
    var ageValue: String = "" {
        didSet {
            getDin()
        }
    }

    init() {
        self.genderArray = sizeManager.genderArray
        self.bootSizeLocaleArray = sizeManager.bootSizeLocaleArray
        self.euBootSizeArray = sizeManager.euMenBootSizeArray
        self.usBootSizeArray = sizeManager.usBootSizeArray
    }

    func getMonSize(locale: String, gender: String, size: String) -> String {
        let monSize = sizeManager.getMonSize(locale: Locale(rawValue: locale) ?? .US, gender: gender, size: size)

        getBootValue(monSize: monSize)

        return "\(monSize.forTrailingZero())"
    }
    
    func didChangeGender(gender: String) {
        if gender == "F" {
            self.euBootSizeArray = sizeManager.euWomenBootSizeArray
        } else {
            self.euBootSizeArray = sizeManager.euMenBootSizeArray
        }
    }
    
    func calculateSkiLength(feet: Int? = nil, inches: Double? = nil, centimeters: Double? = nil) {

        let cmValueToFeet = 30.48

        var convertedInches = Double()

        if inches != nil {
            convertedInches = (inches ?? 0)/12
        }

        if feet != nil && inches != nil {

            let convertedFeet = (Double(feet ?? 0)+convertedInches)
            let feetToCm = convertedFeet*cmValueToFeet
            let idealSkiHeight = feetToCm-10
            print("ConvertedFeet = \(convertedFeet)")
            print("In cm = \(floor(feetToCm))")

            self.getHeightValue(heightInCm: feetToCm)
            self.getSmallestSkiDiff(idealSkiHeight: idealSkiHeight)

        } else if centimeters != nil {

            let idealSkiHeight = (centimeters ?? 0)-10

            self.getHeightValue(heightInCm: centimeters ?? 0)
            self.getSmallestSkiDiff(idealSkiHeight: idealSkiHeight)

        } else {

        }

    }
    
    func calculateWeight(weight: Double? = nil) {
        guard let doubleWeight = weight else { return }

        getWeightValue(weightInLbs: doubleWeight)

    }

    func getSmallestSkiDiff(idealSkiHeight: Double) {
        let skiLength = sizeManager.skiLength
        var currentDifference: Double = 200
        // var currentDifferenceNumber = Double()
        print("Ideal ski height: \(idealSkiHeight)")

        if idealSkiHeight <= 139 {
            self.skiLength = ""
        } else {
            for ski in skiLength.keys {
                if ski <= idealSkiHeight {
                    if (idealSkiHeight - ski) < currentDifference {
                        currentDifference = idealSkiHeight - ski

                        self.skiLength = skiLength[ski]
                        print("Number: \(ski), CurrentDifference: \(currentDifference)")
                    }
                }
            }
        }
    }

    func getDin() {
        guard !self.heightValue.isEmpty && !self.bootValue.isEmpty && !self.skiLevel.isEmpty else { return }
        
        let ageNumb = getAgeValue(age: self.ageValue)

        self.dinValue = dinCalculator.getDinValue(height: self.heightValue, weight: self.weightValue, boot: self.bootValue, level: self.skiLevel, ageValue: ageNumb)
    }

}

// MARK: - Private Functions
extension MainViewModel {
    
    func getAgeValue(age: String) -> Int {
        let dict = sizeManager.ageDict
        let ageValue = dict[age]
        
        return ageValue ?? 0
    }

    private func getBootValue(monSize: Double) {
        if monSize <= 20.5 {
            self.bootValue = "1"
        } else if monSize <= 22.5 {
            self.bootValue = "2"
        } else if monSize <= 26.5 {
            self.bootValue = "3"
        } else if monSize <= 30.5 {
            self.bootValue = "4"
        } else if monSize >= 31 {
            self.bootValue = "5"
        }

        getDin()
    }

    private func getHeightValue(heightInCm: Double) {

        if heightInCm <= 95 {
            self.heightValue = "1"
        } else if heightInCm > 147.5 && heightInCm < 148.5 {
            self.heightValue = "8"
        } else if heightInCm <= 157 {
            self.heightValue = "9"
        } else if heightInCm <= 166 {
            self.heightValue = "10"
        } else if heightInCm <= 178 {
            self.heightValue = "11"
        } else if heightInCm <= 194 {
            self.heightValue = "12"
        } else if heightInCm >= 195 {
            self.heightValue = "13"
        } else {
            self.heightValue = ""
        }

        getDin()
    }

    private func getWeightValue(weightInLbs: Double) {

        if weightInLbs <= 29 {
            self.weightValue = "1"
        } else if weightInLbs <= 38 {
            self.weightValue = "2"
        } else if weightInLbs <= 47 {
            self.weightValue = "3"
        } else if weightInLbs <= 56 {
            self.weightValue = "4"
        } else if weightInLbs <= 66 {
            self.weightValue = "5"
        } else if weightInLbs <= 78 {
            self.weightValue = "6"
        } else if weightInLbs <= 91 {
            self.weightValue = "7"
        } else if weightInLbs <= 107 {
            self.weightValue = "8"
        } else if weightInLbs <= 125 {
            self.weightValue = "9"
        } else if weightInLbs <= 147 {
            self.weightValue = "10"
        } else if weightInLbs <= 174 {
            self.weightValue = "11"
        } else if weightInLbs <= 209 {
            self.weightValue = "12"
        } else if weightInLbs >= 210 {
            self.weightValue = "13"
        }

        getDin()
    }

}
