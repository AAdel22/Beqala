//
//  ViewController.swift
//  Beqala
//
//  Created by AlaaAdel on 1/26/21.
//  Copyright © 2021 AlaaAdel. All rights reserved.
//

import UIKit

class MainCategoryViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource {
    
    var categories = [MainCategories]()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
     var currentResponseCategoriesCount = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        hundleRefrech()
    }
    private func hundleRefrech() {
        Api.mainCategories { (error: Error?, Categories: [MainCategories]?) in
            if let categories = Categories {
                self.categories = categories
                self.collectionView.reloadData()
            }
        }
    }
    // collection View Delegtes
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCategoryCell", for: indexPath) as! MainCategoryCollectionViewCell
        cell.configure(with: categories[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if categories[indexPath.row].id == 1 {
            let superMarketVC = storyboard?.instantiateViewController(identifier: "SuperMarketVC") as! SuperMarketViewController
            self.show(superMarketVC, sender: nil)
        }
    }
    
}

