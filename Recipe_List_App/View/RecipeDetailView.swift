//
//  RecipeDetailView.swift
//  Recipe_List_App
//
//  Created by Grant Davis on 5/22/22.
//

import SwiftUI

struct RecipeDetailView: View {
    
    @State var selectedPortionSize = 2
    
    var recipe: Recipe
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading) {

                //MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFit()
                
                // MARK: Recipe Name
                Text("\(recipe.name)")
                    .font(Font.custom("Avenir Heavy", size: 25))
                    .bold()
                    .padding(.top, 20)
                    .padding(.leading)
                
                Divider()
                
                //MARK: Portion Picker
                VStack(alignment: .leading) {
                Text("Portion Size:")
                        .font(Font.custom("Avenir Heavy", size: 16))
                Picker(selection: $selectedPortionSize, content: {
                        Text("2")
                            .tag(2)
                        Text("4")
                            .tag(4)
                        Text("6")
                            .tag(6)
                        Text("8")
                            .tag(8)
                    }, label: {
                        Text("")
                    })
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 160)
                }
                .padding([.leading, .bottom, .top])
                
                Divider()
                
                //MARK: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients:")
                        .font(Font.custom("Avenir Heavy", size: 16))
                        .padding([.bottom, .top], 2)
                    ForEach(recipe.ingredients) { r in
                        Text("• " + RecipeModel.calculatePortion(ingredient: r, recipePortion: recipe.servings, targetPortion: selectedPortionSize) + " " + r.name.lowercased())
                            .font(Font.custom("Avenir", size: 15))
                    }
                }.padding(.horizontal)
                
                //MARK: Divider
                Divider()
                
                //MARK: Directions
                VStack(alignment: .leading) {
                    Text("Directions:")
                        .font(Font.custom("Avenir Heavy", size: 16))
                        .padding([.top, .bottom], 1)
                    ForEach(0..<recipe.directions.count, id: \.self) { index in
                        Text("\(index + 1). " + recipe.directions[index])
                            .font(Font.custom("Avenir", size: 15))
                    }
                }.padding(.horizontal)
            }
        
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let model = RecipeModel()

        RecipeDetailView(recipe: model.recipes[0])
    }
}
