//
//  ModelData.swift
//  MercadoLibre
//
//  Created by Gaston Gasquet on 22/04/2021.
//

import Foundation

struct ModelData: Codable {
    let query: String?
    let results: [Results]
    
    struct Results: Codable {
        let title: String?
        let price: Double?
        let condition: String?
    }
    
}
