//
//  DataService.swift
//  Recipe_List_App
//
//  Created by Grant Davis on 5/19/22.
//

import Foundation

class DataService {
    
    static func getLocalData() -> [Recipe] {
        
        // Parse local JSON file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
            
        // Get URL path to JSON file
        
        // Check if pathString is not nil, otherwise return empty Recipe list
        // Make sure something is true before continuing
        guard pathString != nil else {
            return [Recipe]()
        }
        
        // Create URL object
        let url = URL(fileURLWithPath: pathString!)
        
        // Create a Data object
        do {
            let data = try Data(contentsOf: url)
            
            // Create JSON decoder
            let decoder = JSONDecoder()
            
            // Decode data with JSON decoder
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                // Add the unique ID's
                for r in recipeData {
                    r.id = UUID()
                }
                
                // Return the recipes
                return recipeData
            }
            catch {
                // Unable to decode data
                print(error)
            }
        }
        catch {
            // Error with getting data
            print(error)
        }
        return [Recipe]()
    }
}
