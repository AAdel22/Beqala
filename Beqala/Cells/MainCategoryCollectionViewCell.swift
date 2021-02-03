//
//  MainCategoryCollectionViewCell.swift
//  Beqala
//
//  Created by AlaaAdel on 1/26/21.
//  Copyright © 2021 AlaaAdel. All rights reserved.
//

import UIKit
import Kingfisher
class MainCategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var categoryBackgroundView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cellDesign()
    }
    func cellDesign() {
        self.imageView.layer.cornerRadius = 25
        self.categoryBackgroundView.layer.cornerRadius = 25
        self.categoryBackgroundView.layer.borderWidth = 3
        self.categoryBackgroundView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.categoryBackgroundView.clipsToBounds = true
    }
    func configure(with data: MainCategories){
        self.label.text = data.name
        self.imageView.kf.setImage(with: URL(string: data.image!))
    }
}
