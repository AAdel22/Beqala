//
//  Api.swift
//  Beqala
//
//  Created by AlaaAdel on 1/27/21.
//  Copyright © 2021 AlaaAdel. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Api: NSObject {
    
    class func mainCategories(completion: @escaping (_ error: Error?, _ categories: [MainCategories]?)-> Void) {
        
        let url = URLs.mainCategories
        
        
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil) .responseJSON { response in
            
            switch response.result {
            case .failure(let error):
                completion(error, nil)
                print(error)
            case .success(let value):
                let json = JSON(value)
                print(json)
                guard let dataArr = json["data"]["main_categories"].array else {
                    completion(nil,nil)
                    return
                }
                
                var categories = [MainCategories]()
                for data in dataArr {
                    guard let data = data.dictionary else {return}
                    let categorie = MainCategories()
                    categorie.id = data["id"]?.int ?? 0
                    categorie.name = data["name"]?.string ?? ""
                    categorie.image = data["image"]?.string ?? ""
                    
                    categories.append(categorie)
                }
                completion(nil,categories)
            }
        }
    }
    
    class func categories(completion: @escaping (_ error: Error?, _ categories: [Categories]?)-> Void) {
        
        let url = URLs.Categories
        
        
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil) .responseJSON { response in
            
            switch response.result {
            case .failure(let error):
                completion(error, nil)
                print(error)
            case .success(let value):
                let json = JSON(value)
                print(json)
                guard let dataArr = json["data"]["categories"].array else {
                    completion(nil,nil)
                    return
                }
                
                var categories = [Categories]()
                for data in dataArr {
                    guard let data = data.dictionary else {return}
                    let categorie = Categories()
                    categorie.id = data["id"]?.int ?? 0
                    categorie.name = data["name"]?.string ?? ""
                    categorie.image = data["image"]?.string ?? ""

                    categories.append(categorie)
                }
                completion(nil,categories)
            }
        }
    }
    class func subCategories(id: Int,completion: @escaping (_ error: Error?, _ categories: [SubCategories]?)-> Void) {
        
        let url = URLs.SubCategories + "\(id)"
        
        
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil) .responseJSON { response in
            
            switch response.result {
            case .failure(let error):
                completion(error, nil)
                print(error)
            case .success(let value):
                let json = JSON(value)
                print(json)
                guard let dataArr = json["data"]["sub_categories"].array else {
                    completion(nil,nil)
                    return
                }
                
                var categories = [SubCategories]()
                for data in dataArr {
                    guard let data = data.dictionary else {return}
                    let categorie = SubCategories()
                    categorie.id = data["id"]?.int ?? 0
                    categorie.name = data["name"]?.string ?? ""
                    categorie.image = data["image"]?.string ?? ""

                    categories.append(categorie)
                }
                completion(nil,categories)
            }
        }
    }
    
    class func allProducts(completion: @escaping (_ error: Error?, _ products: [AllProducts]?)-> Void) {
        
        let url = URLs.allProducts
        
        
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil) .responseJSON { response in
            
            switch response.result {
            case .failure(let error):
                completion(error, nil)
                print(error)
            case .success(let value):
                let json = JSON(value)
                print(json)
                guard let dataArr = json["data"]["products"].array else {
                    completion(nil,nil)
                    return
                }
                
                var products = [AllProducts]()
                for data in dataArr {
                    guard let data = data.dictionary else {return}
                    let product = AllProducts()
                    product.id = data["id"]?.int ?? 0
                    product.name = data["name"]?.string ?? ""
                    product.image = data["image"]?.string ?? ""

                    products.append(product)
                }
                completion(nil,products)
            }
        }
    }
    
    class func gatProductsById(id: Int, completion: @escaping (_ error: Error?, _ products: [AllProducts]?)-> Void) {
           
        let url = URLs.gatProductsById + "\(id)"
           
           AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil) .responseJSON { response in
               
               switch response.result {
               case .failure(let error):
                   completion(error, nil)
                   print(error)
               case .success(let value):
                   let json = JSON(value)
                   print(json)
                   guard let dataArr = json["data"]["products"].array else {
                       completion(nil,nil)
                       return
                   }
                   
                   var products = [AllProducts]()
                   for data in dataArr {
                       guard let data = data.dictionary else {return}
                       let product = AllProducts()
                       product.id = data["id"]?.int ?? 0
                       product.name = data["name"]?.string ?? ""
                       product.image = data["image"]?.string ?? ""
                       
                       products.append(product)
                   }
                   completion(nil,products)
               }
           }
       }
    class func singleProduct(productID: Int,completion: @escaping (_ error: Error?, _ products: SingleProduct?)-> Void) {
        
        let url = URLs.singleProduct + "\(productID)"
        
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil) .responseJSON { response in
                   
                   switch response.result {
                   case .failure(let error):
                       completion(error, nil)
                       print(error)
                   case .success(let value):
                       let json = JSON(value)
                       print(json)
                      
                       if json["data"] != JSON.null {
                        let productDetails = json["data"]
                        
                        // load gallery into array
                        let gallery = productDetails["gallery"].arrayValue
                        var names: [Name] = [Name]()
                        for name in gallery {
                            let nameObject: Name = Name(image: name["image"].string ?? "")
                            names.append(nameObject)
                        }
                        
                        let sizes = productDetails["sizes"].arrayValue
                        var sizeNames: [SizeName] = [SizeName]()
                        for size in sizes {
                            let nameObject: SizeName = SizeName(name: size["name"].string, id: size["id"].int)
                            sizeNames.append(nameObject)
                        }
                        
                        let units = productDetails["units"].arrayValue
                        var unitNames: [UnitName] = [UnitName]()
                        for unit in units {
                            let nameObject: UnitName = UnitName(name: unit["name"].string, id: unit["id"].int)
                            unitNames.append(nameObject)
                        }
                        
                        let productDetailsObject = SingleProduct(name: productDetails["name"].stringValue, fullDescription: productDetails["description"].stringValue, galleryURLS: names, sizes: sizeNames, units: unitNames)
                        completion(nil,productDetailsObject)
                    }
                    
            }
        }
    }
}
