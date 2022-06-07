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
        
        var portion = ""
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.denom ?? 1
        var wholePortions = 0
        
        if ingredient.num != nil {
        
        // Get unit portion size by multiplying denominator by the recipe portion
        denominator *= recipePortion
        
        // Get target portion by multiplying numerator by target portions
        numerator *= targetPortion
        
        // Reduce fraction by GCD
            let gcd =  Rational.greatestCommonDivisor(numerator, denominator)
            numerator /= gcd
            denominator /= gcd
        
        // Get whole portion if numerator greater than denominator
            if numerator >= denominator {
                
                // Calculate the wholePortion
                wholePortions = numerator/denominator
                
                // Calculate the remainder
                numerator = numerator % denominator
                
                // Assign to portion
                portion += "\(wholePortions)"
            }
            
        // Express remainder as fraction
            if wholePortions != 0 && numerator != 0 {
                portion += " "
            }
            if numerator > 0 {
                portion += "\(numerator)/\(denominator)"
            }
        }
        
        if var unit = ingredient.unit {
            
            // Calculate appropriate suffix
            
            // If we need to pluralize
            if wholePortions > 1 {
                
                if unit.suffix(2) == "ch" {
                    unit += "es"
                }
                else if unit.suffix(1) == "f" {
                    unit = String(unit.dropLast())
                    unit += "ves"
                }
                else {
                    unit += "s"
                }
            }
            
            if ingredient.num == nil {
                return portion + unit
            }
            return portion + " " + unit
        }
        
        return portion
    }
    
}
