//
//  SizeTableViewCell.swift
//  Beqala
//
//  Created by AlaaAdel on 2/2/21.
//  Copyright © 2021 AlaaAdel. All rights reserved.
//

import UIKit

class SizeTableViewCell: UITableViewCell {

    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var sizeBackGroundView: UIView!
    var isAnimated = false
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cellDesign()
    }

    func cellDesign() {
        self.sizeBackGroundView.layer.cornerRadius = 25
        self.sizeBackGroundView.layer.borderWidth = 3
        self.sizeBackGroundView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.sizeBackGroundView.clipsToBounds = true
    }
    func configure(with data: SizeName){
        self.sizeLabel.text = data.name
    }

}
