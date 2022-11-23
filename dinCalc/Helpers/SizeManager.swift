//
//  SizeManager.swift
//  dinCalc
//
//  Created by Jay on 2022-11-14.
//

import Foundation

class SizeManager {

    // MARK: Constants
    let genderArray = ["M", "F"]
    let skiLevelArray = ["1", "2", "3"]
    let bootSizeLocaleArray = ["US", "EU"]
    let euBootSizeArray = ["37", "39", "40", "42", "43", "44", "45", "46", "47", "48", "49"]
    let usBootSizeArray = ["5", "5.5", "6", "6.5", "7", "7.5", "8", "8.5", "9", "9.5", "10", "10.5", "11", "11.5", "12", "12.5", "13", "14", "15"]

    let skiLength = [140.0: "S", 150.0: "M", 160.0: "L", 170.0: "XL"]
    
    let sizesDictionaries = SizesDictionaries()

    // MARK: - Variables
    var euBootSize = Dictionary<Int, Double>()
    var usBootSize = Dictionary<Double, Double>()

    init(){
        euBootSize = sizesDictionaries.euBootSize
        usBootSize = sizesDictionaries.usBootSize
    }

    func getMonSize(locale: String, gender: String, size: String) -> Double {
        var intSize: Int?
        var doubleSize: Double?
        var monSize = Double()

        if let size = Int(size) {
            intSize = size
        } else if let size = Double(size) {
            doubleSize = size
        }

        if locale == "US" {

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
