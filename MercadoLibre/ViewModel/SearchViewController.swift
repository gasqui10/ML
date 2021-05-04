//
//  SearchViewController.swift
//  MercadoLibre
//
//  Created by Gaston Gasquet on 22/04/2021.
//

import UIKit
import Alamofire

final class SearchViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var searchBar: UISearchBar!
    
    // MARK: - Properties
    var data: ModelData?
    let url = Constants.url
    
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        searchBar.showsCancelButton = true
    }
    
    func searchData(_ searchItem: String) {
        let urlString = url
        AF.request(urlString + searchItem, method: .get).responseDecodable(of: ModelData.self) { response in
            if let user = response.value?.results {
                self.data = response.value
                print(user)
            } else {
                print(response.error!)
            }
        }
    }
    
    func toNextView() {
        let vc = (storyboard?.instantiateViewController(identifier: Constants.storyBoardIDResultsV))! as! ResultsViewController
        vc.modalPresentationStyle = .currentContext
        vc.data = self.data
        show(vc, sender: nil)
        
    }
}

// MARK: - Extensions
extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        if let search = searchBar.text {
            searchData(search)
            toNextView()
        } else {
            print("No item found")
        }
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = nil
        searchBar.resignFirstResponder()
        
        
    }
}

