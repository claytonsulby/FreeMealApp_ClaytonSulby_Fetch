// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Meals
public struct FilterResponse: Codable, Equatable {
    let meals: [FilterItem]
    
    public init(meals: [FilterItem] = []) {
        self.meals = meals
    }
    
    public static func == (lhs: FilterResponse, rhs: FilterResponse) -> Bool {
        return lhs.meals == rhs.meals
    }
}

// MARK: - Meal
public struct FilterItem: Codable, Equatable {
    let strMeal, strMealThumb, idMeal: String
    
    public static func == (lhs: FilterItem, rhs: FilterItem) -> Bool {
        return lhs.strMeal == rhs.strMeal &&
        lhs.strMealThumb == rhs.strMealThumb &&
        lhs.idMeal == rhs.idMeal
    }
}
