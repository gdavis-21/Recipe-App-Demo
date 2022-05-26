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
    
}
