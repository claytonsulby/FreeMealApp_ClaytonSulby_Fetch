// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Meals
public struct FilterResponse: Codable {
    let meals: [Meal]
}

// MARK: - Meal
public struct Meal: Codable {
    let strMeal, strMealThumb, idMeal: String
}
