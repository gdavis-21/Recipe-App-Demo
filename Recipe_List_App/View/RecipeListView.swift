//
//  RecipeListView.swift
//  Recipe_List_App
//
//  Created by Grant Davis on 5/19/22.
//

import SwiftUI

struct RecipeListView: View {
    
    // Reference ViewModel
    @EnvironmentObject var model: RecipeModel
    
    var body: some View {
        NavigationView {
            
            VStack(alignment: .leading) {
                Text("All Recipes")
                    .font(Font.custom("Avenir Heavy", size: 25))
                    .bold()
                    .padding(.top, 40)
                ScrollView {
                    VStack {
                        LazyVStack(alignment: .leading) {
                            ForEach(model.recipes) { r in
                                NavigationLink(destination: {
                                    RecipeDetailView(recipe: r)
                                }, label: {
                                    // MARK: Row Item
                                    HStack {
                                        Image(r.image)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 50, height: 50, alignment: .center)
                                            .clipped()
                                            .cornerRadius(5)
                                        VStack(alignment: .leading) {
                                            Text(r.name)
                                                .foregroundColor(.black)
                                                .font(Font.custom("Avenir Heavy", size: 16))
                                                .bold()
                                            RecipeHighlights(highlights: r.highlights)
                                                .foregroundColor(.black)
                                                .font(Font.custom("Avenir", size: 15))
                                        }
                                    }
                                })
                            }
                        }
                    }
                }
            }
            .navigationBarHidden(true)
            .padding(.leading)
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}
