//
//  PlantResponse.swift
//  5_PlantsAPI
//
//  Created by 박다미 on 2023/10/30.
//

import Foundation


struct PlantResponse: Codable {
    let body: PlantResponseBody
}

struct PlantResponseBody: Codable {
    let items: PlantItems
}

struct PlantItems: Codable {
    let item: [Plant]
}
