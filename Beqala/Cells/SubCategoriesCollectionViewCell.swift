//
//  SubCategoriesCollectionViewCell.swift
//  Beqala
//
//  Created by AlaaAdel on 1/29/21.
//  Copyright © 2021 AlaaAdel. All rights reserved.
//

import UIKit

class SubCategoriesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var subCategoriesBackgroundView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cellDesign()
    }
    func cellDesign() {
        
        self.subCategoriesBackgroundView.layer.cornerRadius = 25
        self.subCategoriesBackgroundView.layer.borderWidth = 3
        self.subCategoriesBackgroundView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.subCategoriesBackgroundView.clipsToBounds = true
    }
    func configure(with data: SubCategories){
        self.nameLabel.text = data.name
    }
}
