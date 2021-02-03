//
//  SuperMarketViewController.swift
//  Beqala
//
//  Created by AlaaAdel on 1/29/21.
//  Copyright © 2021 AlaaAdel. All rights reserved.
//

import UIKit

class SuperMarketViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource,UICollectionViewDelegateFlowLayout {
    
    
    private var refreshController:UIRefreshControl = UIRefreshControl()
    
    @IBOutlet weak var collectionViewCategories: UICollectionView!
    
    @IBOutlet weak var collectionViewSubCategories: UICollectionView!
    
    @IBOutlet weak var tableView: UITableView!
    
    var categories = [Categories]()
    var subCategories = [SubCategories]()
    var products = [AllProducts]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionViewCategories.delegate = self
        collectionViewCategories.dataSource = self
        
        collectionViewSubCategories.delegate = self
        collectionViewSubCategories.dataSource = self
        
        tableView.delegate = self
        tableView.dataSource = self
        hundleRefrech()
        
        refreshController.addTarget(self, action: #selector(refreshTheTableView), for: UIControl.Event.valueChanged)
        self.tableView.refreshControl = refreshController
        self.tableView.addSubview(refreshController)
    }
    
    @objc func refreshTheTableView(){
       
        self.hundleRefrech()
        
        self.refreshController.endRefreshing()
    }
    
    private func hundleRefrech() {
        Api.categories { (error: Error?, Categories: [Categories]?) in
            if let categories = Categories {
                self.categories = categories
                self.collectionViewCategories.reloadData()
            }
        }
        Api.allProducts { (error: Error?, products: [AllProducts]?) in
            if let products = products {
                self.products = products
                self.tableView.reloadData()
            }
        }
        Api.subCategories(id: 3) { (error: Error?, subCategorie: [SubCategories]?) in
                if let subCategorie = subCategorie {
                    self.subCategories = subCategorie
                    self.collectionViewSubCategories.reloadData()
                }
            }
        
    }
   

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionViewCategories {
            return categories.count
        }else {
            return subCategories.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionViewCategories {
            let cell = collectionViewCategories.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoriesCollectionViewCell
            cell.configure(with: categories[indexPath.row])
            return cell
        } else {
            let cell = collectionViewSubCategories.dequeueReusableCell(withReuseIdentifier: "SubCategoriesCell", for: indexPath) as! SubCategoriesCollectionViewCell
            cell.configure(with: subCategories[indexPath.row])
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.collectionViewCategories {
            Api.subCategories(id: categories[indexPath.row].id!) { (error: Error?, subCategorie: [SubCategories]?) in
                if let subCategorie = subCategorie {
                    self.subCategories = subCategorie
                    self.collectionViewSubCategories.reloadData()
                }
            }
        } else if collectionView == self.collectionViewSubCategories {
            Api.gatProductsById(id: subCategories[indexPath.row].id!) { (error: Error?, products: [AllProducts]?) in
                if let products = products {
                    self.products = products
                    self.tableView.reloadData()
                }
            }
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return  CGSize(width: 125, height: 50)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as! ProductTableViewCell
        cell.configure(with: products[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let productId = products[indexPath.row].id
        let singleProductVC = storyboard?.instantiateViewController(withIdentifier: "SingleProductVC") as! SingleProductViewController
        singleProductVC.idProduct = productId
        
        self.show(singleProductVC, sender: nil)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        
        let cell1 = cell as! ProductTableViewCell
        if !cell1.isAnimated {
            // the init state of the cell
            cell.alpha = 0
            let transform = CATransform3DTranslate(CATransform3DIdentity, -250, 20, 0)
            cell.layer.transform = transform
            
            // animate the cell to the final state
            UIView.animate(withDuration: 1.0) {
                cell.alpha = 1.0
                cell.layer.transform = CATransform3DIdentity
            }
            cell1.isAnimated = true
        }
    }
    
    
}
