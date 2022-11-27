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
//    let weight = "5"
//    let boot = "4"

    init() {
        self.dinChart = getTabData()
       //) print(getDinValue(height: "", weight: self.weight, boot: self.boot))
    }

    private func getTabData() -> DataFrame {
        guard let fileUrl = Bundle.main.url(forResource: "dinChart", withExtension: "csv") else { return DataFrame() }

        let options = CSVReadingOptions(hasHeaderRow: true, delimiter: ",")
        var dinChart = (try? DataFrame(
            contentsOfCSVFile: fileUrl,
            options: options)) ?? DataFrame()

        return dinChart
    }

    func getDinValue(height: String, weight: String, boot: String, level: String) -> String {
        guard let chart = self.dinChart else { return "" }

        let l
        if !height.isEmpty && !weight.isEmpty {
            var rowValue = min(Int(height) ?? 0, Int(weight) ?? 0)
            if
        let dinValue = chart[column: Int(boot) ?? 0][(rowValue-1)]
        }

        // First number is column, second is row
        let dinValue = chart[column: Int(boot) ?? 0][((Int(height) ?? 0)-1)]

        return "\(dinValue ?? "")"
    }
}
