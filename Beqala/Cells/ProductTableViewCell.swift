//
//  ProductTableViewCell.swift
//  Beqala
//
//  Created by AlaaAdel on 1/31/21.
//  Copyright © 2021 AlaaAdel. All rights reserved.
//

import UIKit
import Kingfisher
class ProductTableViewCell: UITableViewCell {

    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var productBackgroundView: UIView!
    
     var isAnimated = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cellDesign()
    }
    func cellDesign() {
           
           self.productBackgroundView.layer.cornerRadius = 25
           self.productBackgroundView.layer.borderWidth = 3
           self.productBackgroundView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
           self.productBackgroundView.clipsToBounds = true
       }

    func configure(with data: AllProducts){
        self.nameLabel.text = data.name
        self.productImageView.kf.setImage(with: URL(string: data.image!))
    }
}
