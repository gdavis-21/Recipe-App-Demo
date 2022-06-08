//
//  RecipeHighlights.swift
//  Recipe_List_App
//
//  Created by Grant Davis on 6/7/22.
//

import SwiftUI

struct RecipeHighlights: View {
    
    var allHighlights = ""
    
    init(highlights: [String]) {
        // Loop through highlights and build highlights
        for index in 0...highlights.count - 1  {
            
            // If last item, don't add a comma.
            if index == highlights.count - 1 {
                allHighlights += "\(highlights[index])"
            }
            else {
                allHighlights += "\(highlights[index]), "
            }
        }
    }
    
    var body: some View {
        Text(allHighlights)
    }
}

struct RecipeHighlights_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHighlights(highlights: ["Test1", "Test2", "Test3"])
    }
}
