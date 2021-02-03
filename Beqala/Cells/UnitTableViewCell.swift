//
//  UnitTableViewCell.swift
//  Beqala
//
//  Created by AlaaAdel on 2/2/21.
//  Copyright © 2021 AlaaAdel. All rights reserved.
//

import UIKit

class UnitTableViewCell: UITableViewCell {

    @IBOutlet weak var unitLabel: UILabel!
    @IBOutlet weak var unitBackGroundView: UIView!
    var isAnimated = false
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cellDesign()
    }
    func cellDesign() {
        self.unitBackGroundView.layer.cornerRadius = 25
        self.unitBackGroundView.layer.borderWidth = 3
        self.unitBackGroundView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.unitBackGroundView.clipsToBounds = true
    }

    func configure(with data: UnitName){
        self.unitLabel.text = data.name
    }

}
