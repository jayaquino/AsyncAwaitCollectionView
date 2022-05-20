//
//  DessertModel.swift
//
//  Created by Nelson Aquino Jr  on 5/17/22.
//

import Foundation

struct MealsModel : Codable {
    
    let meals : [MealDetails]
    
    struct MealDetails : Codable {
        let strMeal : String
        let strMealThumb : String
        let idMeal : String
    }
    
}
