//
//  DetailsViewController.swift
//  MercadoLibre
//
//  Created by Gaston Gasquet on 04/05/2021.
//

import UIKit

final class DetailsViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var currencyLabel: UILabel!
    
    
    // MARK: - Properties
    var data: ModelData.Results?
    
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        
    }
    
    private func setupData() {
        guard let data = data else { return }
        conditionLabel.text = data.condition
        titleLabel.text = data.title
        priceLabel.text = String(format:  "%.2f", data.price  ?? 0.0)
        itemImage.image = UIImage(named: data.thumbnail ?? "No image")
        currencyLabel.text = data.currencyID
        
    }
    
    
    
}
