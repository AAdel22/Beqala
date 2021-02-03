//
//  SingleProductViewController.swift
//  Beqala
//
//  Created by AlaaAdel on 2/1/21.
//  Copyright © 2021 AlaaAdel. All rights reserved.
//

import UIKit
import Kingfisher

class SingleProductViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource,UITableViewDelegate, UITableViewDataSource {
   
    
    
    @IBOutlet weak var nameProductLabel: UILabel!
    @IBOutlet weak var descriptionProductLabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var sizeTableView: UITableView!
    
    @IBOutlet weak var unitTableView: UITableView!
    var idProduct: Int?
    var singleProduct: SingleProduct?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        self.sizeTableView.delegate = self
        self.sizeTableView.dataSource = self
        
        self.unitTableView.delegate = self
        self.unitTableView.dataSource = self
        
        Api.singleProduct(productID: idProduct ?? 0) { (error: Error?, singleProduct: SingleProduct?) in
            self.singleProduct = singleProduct
            self.nameProductLabel.text = singleProduct?.name
            self.descriptionProductLabel.text = singleProduct?.fullDescription
            self.collectionView.reloadData()
            self.sizeTableView.reloadData()
            self.unitTableView.reloadData()
            
        }
    }
    

   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return singleProduct?.galleryURLS.count ?? 0
   }
   
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductImagesCell", for: indexPath) as! ProductImagesCollectionViewCell
    cell.configure(with: (singleProduct?.galleryURLS[indexPath.row])!)
    return cell
   }
    
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if tableView == self.sizeTableView {
        return singleProduct?.sizes.count ?? 0
    } else if tableView == self.unitTableView {
        return singleProduct?.units.count ?? 0
    }else {
        return 0
    }
    
    }
       
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if tableView == self.sizeTableView {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SizeCell", for: indexPath) as! SizeTableViewCell
        cell.configure(with: (singleProduct?.sizes[indexPath.row])!)
        return cell
    }else if tableView == self.unitTableView{
        let cell = tableView.dequeueReusableCell(withIdentifier: "UnitCell", for: indexPath) as! UnitTableViewCell
        cell.configure(with: (singleProduct?.units[indexPath.row])!)
        return cell
    } else {
        return UITableViewCell()
    }
    
    }
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        
//        
//        let cell1 = cell as! SizeTableViewCell
//        let cell2 = cell as! UnitTableViewCell
//        if !cell1.isAnimated {
//            // the init state of the cell
//            cell.alpha = 0
//            let transform = CATransform3DTranslate(CATransform3DIdentity, -250, 20, 0)
//            cell.layer.transform = transform
//            
//            // animate the cell to the final state
//            UIView.animate(withDuration: 1.0) {
//                cell.alpha = 1.0
//                cell.layer.transform = CATransform3DIdentity
//            }
//            cell1.isAnimated = true
//        }else if !cell2.isAnimated {
//            // the init state of the cell
//            cell.alpha = 0
//            let transform = CATransform3DTranslate(CATransform3DIdentity, -250, 20, 0)
//            cell.layer.transform = transform
//            
//            // animate the cell to the final state
//            UIView.animate(withDuration: 1.0) {
//                cell.alpha = 1.0
//                cell.layer.transform = CATransform3DIdentity
//            }
//            cell2.isAnimated = true
//        }
//    }

}
