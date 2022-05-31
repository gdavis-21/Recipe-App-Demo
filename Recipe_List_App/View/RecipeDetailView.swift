//
//  RecipeDetailView.swift
//  Recipe_List_App
//
//  Created by Grant Davis on 5/22/22.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe: Recipe
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading) {

                //MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFit()
                
                //MARK: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding([.bottom, .top], 2)
                    ForEach(recipe.ingredients) { r in
                        Text("• " + r.name)
                    }
                }.padding(.horizontal)
                
                //MARK: Divider
                Divider()
                
                //MARK: Directions
                VStack(alignment: .leading) {
                    Text("Directions")
                        .font(.headline)
                        .padding([.top, .bottom], 1)
                    ForEach(0..<recipe.directions.count, id: \.self) { index in
                        Text("\(index + 1). " + recipe.directions[index])
                    }
                }.padding(.horizontal)
            }
        
        }
        .navigationTitle(Text(recipe.name))
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let model = RecipeModel()

        RecipeDetailView(recipe: model.recipes[0])
    }
}
