# Recipe-App-Demo

## Images of App:
![Featured View](Recipe-App-Demo/Featured-View)
![List View](Recipe-App-Demo/List-View)
![Detailed View](Recipe-App-Demo/Detailed-View)

## The Recipe App Demo is a project to test and learn about SwiftUI features:
- TabViews
- NavigationViews
- Pickers
- ObservableObjects
- EnvironmentObjects
- JSON Decoding
- MVVM 

## MVVM
### A Recipe is modeled as a class with the attributes: (Model)
- id: UUID
- name: String
- featured: Bool
- image: String
- description: String
- prepTime: String
- cookTime: String
- totalTime: String
- servings: Int
- ingredients: [Ingredient]
- directions: [String]
- highlights: [String]


### The Demo is divided into five views (V)
- RecipeFeaturedView
- RecipeListView
- RecipeDetailView
- RecipeHighlights

### The logic and data are handled in the recipe view model (View Model)
- RecipeModel

## Future Updates
- Fetch the JSON data from an API.
- Add a way to sort the recipes. 
- Add additional recipes.
