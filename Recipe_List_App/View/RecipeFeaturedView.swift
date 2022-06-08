//
//  RecipeFeaturedView.swift
//  Recipe_List_App
//
//  Created by Grant Davis on 5/31/22.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    @EnvironmentObject var model: RecipeModel
    @State var toPresentDetailView = false
    @State var selectedIndex = 0
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
            Text("Featured Recipes")
                .font(.largeTitle)
                .bold()
                .padding(.leading)
                .padding(.top, 40)
            
            GeometryReader { geo in
                TabView(selection: $selectedIndex) {
                    ForEach(0..<model.recipes.count) { index in
                        // Show featured recipes
                        if model.recipes[index].featured {
                            
                            // Recipe Card Button
                            Button(action: {
                                toPresentDetailView = true
                            }, label: {
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.white)
                                    VStack(spacing: 0) {
                                        Image(model.recipes[index].image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .clipped()
                                        Text(model.recipes[index].name)
                                            .padding(5)
                                    }
                                }
                            })
                            .frame(width: geo.size.width - 40, height: geo.size.height - 100)
                            .cornerRadius(15)
                            .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y: 5)
                            .buttonStyle(PlainButtonStyle())
                            .sheet(isPresented: $toPresentDetailView) {
                                // Instantiate RecipeDetailView
                                RecipeDetailView(recipe: model.recipes[index])
                            }
                            .tag(index)
                        }
                    }
                    
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Preparation Time:")
                    .font(.headline)
                Text(model.recipes[selectedIndex].prepTime)
                Text("Highlights:")
                    .font(.headline)
                RecipeHighlights(highlights: model.recipes[selectedIndex].highlights)
            }
            .padding([.leading, .bottom])
        }
        .onAppear(perform: {
            findFirstFeatured()
        })
    }
    
    func findFirstFeatured() {
        // Find index of first featured recipe
        selectedIndex = model.recipes.firstIndex {
            recipe -> Bool in
                recipe.featured
        } ?? 0
                                                 
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
