//
//  SingleProduct.swift
//  Beqala
//
//  Created by AlaaAdel on 2/1/21.
//  Copyright © 2021 AlaaAdel. All rights reserved.
//

import Foundation

struct SingleProduct {
    
    var name: String?
    var fullDescription: String?
    var galleryURLS: [Name] = []
    var sizes: [SizeName] = []
    var units: [UnitName] = []
    
}

struct Name {
    var image: String?
    
}
struct SizeName {
    var name: String?
    var id: Int?
    
}
struct UnitName {
    var name: String?
    var id: Int?
    
}
