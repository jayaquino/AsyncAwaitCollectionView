//
//  DetailsViewModel.swift
//
//  Created by Nelson Aquino Jr  on 5/18/22.
//

import Foundation

class DetailsViewModel {
    
    //MARK: - Variables
    var ingredients : [IngredientsModel]?
    
    //MARK: - Init
    init (meal : DessertModel.DessertDetails) {
        ingredients = getIngredients(dessert: meal)
        ingredients = filterIngredients(ingredients: ingredients!)
    }
    
    //MARK: - Functions
    private func getIngredients(dessert: DessertModel.DessertDetails) -> [IngredientsModel] {
        var ingredients : [IngredientsModel] = []
        
        ingredients.append(IngredientsModel(ingredient: dessert.strIngredient1 ?? "", measurement: dessert.strMeasure1 ?? ""))
        ingredients.append(IngredientsModel(ingredient: dessert.strIngredient2 ?? "", measurement: dessert.strMeasure2 ?? ""))
        ingredients.append(IngredientsModel(ingredient: dessert.strIngredient3 ?? "", measurement: dessert.strMeasure3 ?? ""))
        ingredients.append(IngredientsModel(ingredient: dessert.strIngredient4 ?? "", measurement: dessert.strMeasure4 ?? ""))
        ingredients.append(IngredientsModel(ingredient: dessert.strIngredient5 ?? "", measurement: dessert.strMeasure5 ?? ""))
        ingredients.append(IngredientsModel(ingredient: dessert.strIngredient6 ?? "", measurement: dessert.strMeasure6 ?? ""))
        ingredients.append(IngredientsModel(ingredient: dessert.strIngredient7 ?? "", measurement: dessert.strMeasure7 ?? ""))
        ingredients.append(IngredientsModel(ingredient: dessert.strIngredient8 ?? "", measurement: dessert.strMeasure8 ?? ""))
        ingredients.append(IngredientsModel(ingredient: dessert.strIngredient9 ?? "", measurement: dessert.strMeasure9 ?? ""))
        ingredients.append(IngredientsModel(ingredient: dessert.strIngredient10 ?? "", measurement: dessert.strMeasure10 ?? ""))
        ingredients.append(IngredientsModel(ingredient: dessert.strIngredient11 ?? "", measurement: dessert.strMeasure11 ?? ""))
        ingredients.append(IngredientsModel(ingredient: dessert.strIngredient12 ?? "", measurement: dessert.strMeasure12 ?? ""))
        ingredients.append(IngredientsModel(ingredient: dessert.strIngredient13 ?? "", measurement: dessert.strMeasure13 ?? ""))
        ingredients.append(IngredientsModel(ingredient: dessert.strIngredient14 ?? "", measurement: dessert.strMeasure14 ?? ""))
        ingredients.append(IngredientsModel(ingredient: dessert.strIngredient15 ?? "", measurement: dessert.strMeasure15 ?? ""))
        ingredients.append(IngredientsModel(ingredient: dessert.strIngredient16 ?? "", measurement: dessert.strMeasure16 ?? ""))
        ingredients.append(IngredientsModel(ingredient: dessert.strIngredient17 ?? "", measurement: dessert.strMeasure17 ?? ""))
        ingredients.append(IngredientsModel(ingredient: dessert.strIngredient18 ?? "", measurement: dessert.strMeasure18 ?? ""))
        ingredients.append(IngredientsModel(ingredient: dessert.strIngredient19 ?? "", measurement: dessert.strMeasure19 ?? ""))
        ingredients.append(IngredientsModel(ingredient: dessert.strIngredient20 ?? "", measurement: dessert.strMeasure20 ?? ""))
        
        return ingredients
    }
    
    private func filterIngredients(ingredients: [IngredientsModel]) -> [IngredientsModel]{
        var filteredIngredients : [IngredientsModel] = []
        for ingredient in ingredients {
            if ingredient.ingredient != " " && !ingredient.ingredient.isEmpty{
                filteredIngredients.append(IngredientsModel(ingredient: ingredient.ingredient, measurement: ingredient.measurement))
            }
        }
        return filteredIngredients
    }
}
