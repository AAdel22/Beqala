//
//  ProductImagesCollectionViewCell.swift
//  Beqala
//
//  Created by AlaaAdel on 2/2/21.
//  Copyright © 2021 AlaaAdel. All rights reserved.
//

import UIKit
import  Kingfisher
class ProductImagesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var productImagesView: UIImageView!
    @IBOutlet weak var imageBackGroundView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cellDesign()
    }
    func cellDesign() {
        self.productImagesView.layer.cornerRadius = 25
        self.imageBackGroundView.layer.cornerRadius = 25
        self.imageBackGroundView.layer.borderWidth = 3
        self.imageBackGroundView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.imageBackGroundView.clipsToBounds = true
    }
    
    func configure(with data: Name){
        let imgURL = URL(string: data.image!)
        let resource = ImageResource(downloadURL: imgURL!)
        self.productImagesView?.kf.setImage(with: resource)

    }
}
