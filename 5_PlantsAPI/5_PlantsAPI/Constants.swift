//
//  Constants.swift
//  5_PlantsAPI
//
//  Created by 박다미 on 2023/10/30.
//

import Foundation
struct Plant: Codable {
    let krnm: String
    let kornFamlNm: String
    let bloomPeriodCN: String
    let fturCN: String
    let imgURL: String

    enum CodingKeys: String, CodingKey {
        case krnm
        case kornFamlNm
        case bloomPeriodCN = "bloomPeriodCn"
        case fturCN = "fturCn"
        case imgURL = "imgUrl"
    }
}


