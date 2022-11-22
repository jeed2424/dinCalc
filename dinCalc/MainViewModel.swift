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

    @Published var genderArray: [String]
    @Published var bootSizeLocaleArray: [String]
    @Published var euBootSizeArray: [String]
    @Published var usBootSizeArray: [String]
    @Published var skiLength: String?

    init() {
        self.genderArray = sizeManager.genderArray
        self.bootSizeLocaleArray = sizeManager.bootSizeLocaleArray
        self.euBootSizeArray = sizeManager.euBootSizeArray
        self.usBootSizeArray = sizeManager.usBootSizeArray
    }

    func getMonSize(locale: String, gender: String, size: String) -> String {
        let monSize = sizeManager.getMonSize(locale: locale, gender: gender, size: size)

        return "\(monSize.forTrailingZero())"
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

            self.getSmallestSkiDiff(idealSkiHeight: idealSkiHeight)

        } else if centimeters != nil {

            let idealSkiHeight = (centimeters ?? 0)-10

            self.getSmallestSkiDiff(idealSkiHeight: idealSkiHeight)

        } else {

        }

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


//        let length = skiLength.keys.first(where: {
//            idealSkiHeight >= $0 && $0 >= idealSkiHeight-9.9999
//        }) ?? 0

    }
}
