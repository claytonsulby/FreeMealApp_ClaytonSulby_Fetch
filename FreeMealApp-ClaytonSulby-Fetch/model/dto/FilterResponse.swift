// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - FilterResponse
public struct FilterResponse: Codable, Equatable {
    let meals: [FilterItem]
    
    public init(meals: [FilterItem] = []) {
        self.meals = meals
    }
    
    public static func == (lhs: FilterResponse, rhs: FilterResponse) -> Bool {
        return lhs.meals == rhs.meals
    }
}

// MARK: - FilterItem
public struct FilterItem: Codable, Equatable {
    public let strMeal, strMealThumb, id: String
    
    public static func == (lhs: FilterItem, rhs: FilterItem) -> Bool {
        return lhs.strMeal == rhs.strMeal &&
        lhs.strMealThumb == rhs.strMealThumb &&
        lhs.id == rhs.id
    }
    
    enum CodingKeys: String, CodingKey {
        case strMeal
        case strMealThumb
        case id = "idMeal"
    }
}

extension FilterItem: Identifiable {
}
