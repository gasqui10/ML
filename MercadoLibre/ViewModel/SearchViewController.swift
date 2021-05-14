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
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Properties
    var searchData: ModelData?
    let url = Constants.url
    
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        searchBar.showsCancelButton = true
        activityIndicator.isHidden = true
    }
    
    func searchData(_ searchItem: String) {
        let urlString = url
        AF.request(urlString + searchItem, method: .get).responseDecodable(of: ModelData.self) { response in
            if let user = response.value?.results {
                DispatchQueue.main.async {
                    self.searchData = response.value
                    self.toNextView()
                    print(user)
                }
                
            } else {
                self.showAlert()
                print(response.error!)
            }
        }
    }
    
    private func toNextView() {
        let vc = (storyboard?.instantiateViewController(identifier: Constants.storyBoardIDResultsV))! as! ResultsViewController
        activityIndicator.stopAnimating()
        activityIndicator.hidesWhenStopped = true
        vc.modalPresentationStyle = .currentContext
        vc.resultData = self.searchData
        show(vc, sender: nil)
        
    }
    
    private func showAlert() {
        let alertConnection = UIAlertController(title: "No internet connection!!", message: nil, preferredStyle: .alert)
        alertConnection.addAction(UIAlertAction(title: "Try again", style: .default, handler: nil))
        present(alertConnection, animated: true, completion: nil)
        
    }
    
}

// MARK: - Extensions
extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        if let search = searchBar.text {
            searchData(search.addingPercentEncoding(withAllowedCharacters: .afURLQueryAllowed)!)
            self.activityIndicator.isHidden = false
            self.activityIndicator.startAnimating()
        } else {
            return
        }
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = nil
        searchBar.resignFirstResponder()
        
        
    }
}

