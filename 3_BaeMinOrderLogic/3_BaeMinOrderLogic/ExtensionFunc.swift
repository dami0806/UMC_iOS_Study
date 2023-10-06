//
//  ExtensionFunc.swift
//  3_BaeMinOrderLogic
//
//  Created by 박다미 on 2023/10/04.
//

import Foundation

func numberWithComma(_ number: Int) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    if let formattedNumber = formatter.string(from: NSNumber(value: number)) {
        return formattedNumber
    }
    return ""
}
