//
//  MercadoLibreTest.swift
//  MercadoLibreTest
//
//  Created by Gaston Gasquet on 09/05/2021.
//

import XCTest
import Alamofire
@testable import MercadoLibre


class MercadoLibreTest: XCTestCase {
    
    var sut: SearchViewController!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = SearchViewController()
    
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()

    }
    
    func tesGetMethodWithMethodURLAndDestination() {
        // MARK: - Given
        let endpoint = "https://api.mercadolibre.com/sites/MLA/search?q=iphone12"
        
        // MARK: - When
        let request = AF.request(endpoint, method: .get)
        
        // MARK: - Then
        XCTAssertEqual(request.request?.httpMethod, "GET")
    }

    
    

}
