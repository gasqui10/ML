//
//  ResultsViewController.swift
//  MercadoLibre
//
//  Created by Gaston Gasquet on 22/04/2021.
//

import UIKit

// MARK: - DATA IS NOT LOADING INTO TABLEVIEW
final class ResultsViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - Properties
    var data: ModelData?
    
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
    }
    
}

// MARK: - Extensions
extension ResultsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension ResultsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cell, for: indexPath)
        cell.textLabel?.text = data?.results[indexPath.row].title
        return cell
        
        
    }
    
    
}
