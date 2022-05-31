//
//  RecipeTabView.swift
//  Recipe_List_App
//
//  Created by Grant Davis on 5/25/22.
//

import SwiftUI

struct RecipeTabView: View {
    var body: some View {
        
        TabView {
            // MARK: First Tab: Featured
            RecipeFeaturedView()
                .tabItem({
                    VStack {
                        Image(systemName: "star.fill")
                        Text("Featured")
                    }
                })
            // MARK: Second Tab: All recipes
            RecipeListView()
                .tabItem({
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("List")
                    }
                })
        }.environmentObject(RecipeModel())
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
