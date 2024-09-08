// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let filterResponse = try? JSONDecoder().decode(FilterResponse.self, from: jsonData)

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
public struct FilterItem: Codable, Equatable, Hashable {
    public let id, name, thumbnail: String
    
    public static func == (lhs: FilterItem, rhs: FilterItem) -> Bool {
        return lhs.id == rhs.id &&
        lhs.name == rhs.name &&
        lhs.thumbnail == rhs.thumbnail
    }
    
    enum CodingKeys: String, CodingKey {
        case name = "strMeal"
        case thumbnail = "strMealThumb"
        case id = "idMeal"
    }
}

extension FilterItem: Identifiable {
}
