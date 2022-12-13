//
//  dinCalculator.swift
//  dinCalc
//
//  Created by Jay on 2022-11-24.
//

import Foundation
import TabularData

class DinCalculator: ObservableObject {
    var dinChart: DataFrame?
//    let weight = 5
//    let boot = 5

    init() {
        self.dinChart = getTabData()
    }

    private func getTabData() -> DataFrame {
        guard let fileUrl = Bundle.main.url(forResource: "dinChart", withExtension: "csv") else { return DataFrame() }

        let options = CSVReadingOptions(hasHeaderRow: true, delimiter: ",")
        let dinChart = (try? DataFrame(
            contentsOfCSVFile: fileUrl,
            options: options)) ?? DataFrame()
        print(dinChart)

        return dinChart
    }

    func getDinValue(height: String, weight: String, boot: String, level: String) -> String {
        guard let chart = self.dinChart else { return "" }

        let numbHeight = Int(height)
        let numbWeight = Int(weight)
        let numbBoot = Int(boot) 
        let numbLevel = Int(level) ?? 1

        var additionLevel = (numbLevel - 1)

        var dinValue = ""

        if (!height.isEmpty && !weight.isEmpty) && (numbHeight != 0 && numbWeight != 0) {
            var rowValue = min(Int(height) ?? 0, Int(weight) ?? 0)

            rowValue += additionLevel

            let tempDin = chart[column: Int(boot) ?? 0][(rowValue-1)]

            return "\(tempDin ?? "")"
        } else if !height.isEmpty && numbHeight != 0 {

            print("AdditionLevel: \(additionLevel)")

            let rowValue = (numbHeight ?? 1) + additionLevel

            let tempDin = chart[column: Int(boot) ?? 0][(rowValue-1)]
            return "\(tempDin ?? "")"

        } else if !weight.isEmpty && numbWeight != 0 {

            let rowValue = (numbWeight ?? 1) + additionLevel

            let tempDin = chart[column: Int(boot) ?? 0][(rowValue-1)]

            return "\(tempDin ?? "")"
        }
//
//        // First number is column, second is row
//        let dinValue = chart[column: Int(boot) ?? 0][((Int(height) ?? 0)-1)]
//
//        return "\(dinValue ?? "")"
        return ""
    }
}
