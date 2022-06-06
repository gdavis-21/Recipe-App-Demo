//
//  RecipeModel.swift
//  Recipe_List_App
//
//  Created by Grant Davis on 5/19/22.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        // Create an instance of DataService and get the data
        self.recipes = DataService.getLocalData()
    }
    
    static func calculatePortion(ingredient: Ingredient, recipePortion: Int, targetPortion: Int) -> String {
        
        // Get unit portion size by multiplying denominator by the recipe portion
        
        // Get target portion by multiplying numerator by target portions
        
        // Reduce fraction by GCD
        
        // Get whole portion if numerator greater than denominator
        
        // Express remainder as fraction
        
        return String(targetPortion)
    }
    
}
