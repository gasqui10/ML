//
//  ResultsViewController.swift
//  MercadoLibre
//
//  Created by Gaston Gasquet on 22/04/2021.
//

import UIKit

final class ResultsViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    
    
    // MARK: - Properties
    var resultData: ModelData?
    var selectedResult: ModelData.Results?
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.thirdStoryBoard {
            if let destinationVC = segue.destination as? DetailsViewController {
                destinationVC.data = selectedResult
            }
        }
    }
    
}

// MARK: - Extensions
extension ResultsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedResult = resultData?.results[indexPath.row]
        performSegue(withIdentifier: Constants.thirdStoryBoard, sender: self)
        
    }
}

extension ResultsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultData?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cell, for: indexPath)
        cell.textLabel?.text = resultData?.results[indexPath.row].title
        return cell
        
    }
    
}


