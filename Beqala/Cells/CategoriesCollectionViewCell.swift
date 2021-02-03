//
//  CategoriesCollectionViewCell.swift
//  Beqala
//
//  Created by AlaaAdel on 1/29/21.
//  Copyright © 2021 AlaaAdel. All rights reserved.
//

import UIKit
import Kingfisher
class CategoriesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var categoriesBackgroundView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       // initDesign()
    }
    
    func configure(with data: Categories){
           self.nameLabel.text = data.name
           self.imageView.kf.setImage(with: URL(string: data.image!))
       }
}
