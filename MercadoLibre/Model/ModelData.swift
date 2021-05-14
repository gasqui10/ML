//
//  ModelData.swift
//  MercadoLibre
//
//  Created by Gaston Gasquet on 22/04/2021.
//


struct ModelData: Codable {
    let query: String?
    let results: [Results]
    
    struct Results: Codable {
        let title: String?
        let price: Double?
        let condition: String?
        let thumbnail: String?
        let currencyID: String?
        
    
enum CodingKeys: String, CodingKey {
    case title
    case price
    case condition
    case thumbnail
    case currencyID = "currency_id"
        
        }
    }

}




