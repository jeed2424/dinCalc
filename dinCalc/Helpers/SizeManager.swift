//
//  SizeManager.swift
//  dinCalc
//
//  Created by Jay on 2022-11-14.
//

import Foundation

enum Locale: String, CaseIterable {
    case US = "US"
    case EU = "EU"
}

class SizeManager {

    // MARK: Constants
    let genderArray = ["M", "F"]
    let skiLevelArray = ["1", "2", "3"]
    let bootSizeLocaleArray = ["US", "EU"]
    let euMenBootSizeArray = ["37.5", "38", "38.5", "39.5", "40", "40.5", "41.5", "42", "42.5", "43", "44", "44.5", "45", "45.5", "46.5", "47", "47.5", "49", "50"]
    let euWomenBootSizeArray = ["35", "36", "36.5", "37", "37.5", "38", "39", "40", "40.5", "41", "41.5", "42.5", "43", "43.5", "44", "45.5"]
    let usBootSizeArray = ["5", "5.5", "6", "6.5", "7", "7.5", "8", "8.5", "9", "9.5", "10", "10.5", "11", "11.5", "12", "12.5", "13", "14", "15"]
    let ageArray = ["9 & -", "10+", "50+"]
    let ageDict = ["9 & -": -1, "10+": 0, "50+": -1]

    let skiLength = [140.0: "S", 150.0: "M", 160.0: "L", 170.0: "XL"]
    
    let sizesDictionaries = SizesDictionaries()

    // MARK: - Variables
    var euMenBootSize = Dictionary<Double, Double>()
    var euWomenBootSize = Dictionary<Double, Double>()
    var usBootSize = Dictionary<Double, Double>()

    init(){
        euMenBootSize = sizesDictionaries.euMenBootSize
        euWomenBootSize = sizesDictionaries.euWomenBootSize
        usBootSize = sizesDictionaries.usBootSize
    }

    func getMonSize(locale: Locale, gender: String, size: String) -> Double {
        var intSize: Int?
        var doubleSize: Double?
        var monSize = Double()

        if let size = Int(size) {
            intSize = size
        } else if let size = Double(size) {
            doubleSize = size
        }

        switch locale {
        case .US:
            if intSize != nil {
                monSize = usBootSize[Double(intSize ?? 0)] ?? 0

                if gender == "F" {
                    monSize -= 1

                    return monSize
                } else {
                    return monSize
                }

            } else if doubleSize != nil {
                monSize = usBootSize[doubleSize ?? 0] ?? 0

                if gender == "F" {
                    monSize -= 1

                    return monSize
                } else {
                    return monSize
                }
            }
        case .EU:
            if intSize != nil {
                if gender == "F" {
                    monSize = euWomenBootSize[Double(intSize ?? 0)] ?? 0

                    return monSize
                } else {
                    monSize = euMenBootSize[Double(intSize ?? 0)] ?? 0
                    return monSize
                }

            } else if doubleSize != nil {
                if gender == "F" {
                    monSize = euWomenBootSize[doubleSize ?? 0] ?? 0

                    return monSize
                } else {
                    monSize = euMenBootSize[doubleSize ?? 0] ?? 0
                    return monSize
                }
            }
        }

        return 0

    }

    func getSkiSize(feet: Int? = nil, inches: Double? = nil, centimeters: Double? = nil) -> String {

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

            return getSmallestSkiDiff(idealSkiHeight: idealSkiHeight)

        } else if centimeters != nil {

            let idealSkiHeight = (centimeters ?? 0)-10

            return getSmallestSkiDiff(idealSkiHeight: idealSkiHeight)

        } else {
            return ""

        }

    }

    func getSmallestSkiDiff(idealSkiHeight: Double) -> String {
        let length = skiLength.keys.first(where: {
            idealSkiHeight >= $0 && $0 >= idealSkiHeight-9.9999
        }) ?? 0

        return skiLength[length] ?? ""
    }
    
}
