//
//  Ingredient.swift
//  Recipe_List_App
//
//  Created by Grant Davis on 5/31/22.
//

import Foundation

class Ingredient: Decodable, Identifiable {
    
    var id: UUID?
    var name: String
    var num: Int?
    var denom: Int?
    var unit: String?
}
