// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
public struct LookupResponse: Codable, Equatable {
    public let meals: [LookupItem]

    public init(meals: [LookupItem] = []) {
        self.meals = meals
    }
    
    public static func == (lhs: LookupResponse, rhs: LookupResponse) -> Bool {
        return lhs.meals == rhs.meals
    }
}

// MARK: - Meal
public struct LookupItem: Codable, Equatable {
    public let idMeal, strMeal: String
    public let strDrinkAlternate: JSONNull?
    public let strCategory, strArea, strInstructions: String
    public let strMealThumb: String
    public let strTags: String
    public let strYoutube: String
    public let strIngredient1, strIngredient2, strIngredient3, strIngredient4: String
    public let strIngredient5, strIngredient6, strIngredient7, strIngredient8: String
    public let strIngredient9, strIngredient10, strIngredient11, strIngredient12: String
    public let strIngredient13, strIngredient14, strIngredient15, strIngredient16: String
    public let strIngredient17, strIngredient18, strIngredient19, strIngredient20: String
    public let strMeasure1, strMeasure2, strMeasure3, strMeasure4: String
    public let strMeasure5, strMeasure6, strMeasure7, strMeasure8: String
    public let strMeasure9, strMeasure10, strMeasure11, strMeasure12: String
    public let strMeasure13, strMeasure14, strMeasure15, strMeasure16: String
    public let strMeasure17, strMeasure18, strMeasure19, strMeasure20: String
    public let strSource: String
    public let strImageSource, strCreativeCommonsConfirmed, dateModified: JSONNull?

    public static func == (lhs: LookupItem, rhs: LookupItem) -> Bool {
        return lhs.idMeal == rhs.idMeal &&
        lhs.strMeal == rhs.strMeal &&
        lhs.strDrinkAlternate == rhs.strDrinkAlternate &&
        lhs.strCategory == rhs.strCategory &&
        lhs.strArea == rhs.strArea &&
        lhs.strInstructions == rhs.strInstructions &&
        lhs.strMealThumb == rhs.strMealThumb &&
        lhs.strTags == rhs.strTags &&
        lhs.strYoutube == rhs.strYoutube &&
        lhs.strIngredient1 == rhs.strIngredient1 &&
        lhs.strIngredient2 == rhs.strIngredient2 &&
        lhs.strIngredient3 == rhs.strIngredient3 &&
        lhs.strIngredient4 == rhs.strIngredient4 &&
        lhs.strIngredient5 == rhs.strIngredient5 &&
        lhs.strIngredient6 == rhs.strIngredient6 &&
        lhs.strIngredient7 == rhs.strIngredient7 &&
        lhs.strIngredient8 == rhs.strIngredient8 &&
        lhs.strIngredient9 == rhs.strIngredient9 &&
        lhs.strIngredient10 == rhs.strIngredient10 &&
        lhs.strIngredient11 == rhs.strIngredient11 &&
        lhs.strIngredient12 == rhs.strIngredient12 &&
        lhs.strIngredient13 == rhs.strIngredient13 &&
        lhs.strIngredient14 == rhs.strIngredient14 &&
        lhs.strIngredient15 == rhs.strIngredient15 &&
        lhs.strIngredient16 == rhs.strIngredient16 &&
        lhs.strIngredient17 == rhs.strIngredient17 &&
        lhs.strIngredient18 == rhs.strIngredient18 &&
        lhs.strIngredient19 == rhs.strIngredient19 &&
        lhs.strIngredient20 == rhs.strIngredient20 &&
        lhs.strMeasure1 == rhs.strMeasure1 &&
        lhs.strMeasure2 == rhs.strMeasure2 &&
        lhs.strMeasure3 == rhs.strMeasure3 &&
        lhs.strMeasure4 == rhs.strMeasure4 &&
        lhs.strMeasure5 == rhs.strMeasure5 &&
        lhs.strMeasure6 == rhs.strMeasure6 &&
        lhs.strMeasure7 == rhs.strMeasure7 &&
        lhs.strMeasure8 == rhs.strMeasure8 &&
        lhs.strMeasure9 == rhs.strMeasure9 &&
        lhs.strMeasure10 == rhs.strMeasure10 &&
        lhs.strMeasure11 == rhs.strMeasure11 &&
        lhs.strMeasure12 == rhs.strMeasure12 &&
        lhs.strMeasure13 == rhs.strMeasure13 &&
        lhs.strMeasure14 == rhs.strMeasure14 &&
        lhs.strMeasure15 == rhs.strMeasure15 &&
        lhs.strMeasure16 == rhs.strMeasure16 &&
        lhs.strMeasure17 == rhs.strMeasure17 &&
        lhs.strMeasure18 == rhs.strMeasure18 &&
        lhs.strMeasure19 == rhs.strMeasure19 &&
        lhs.strMeasure20 == rhs.strMeasure20 &&
        lhs.strSource == rhs.strSource &&
        lhs.strImageSource == rhs.strImageSource &&
        lhs.strCreativeCommonsConfirmed == rhs.strCreativeCommonsConfirmed &&
        lhs.dateModified == rhs.dateModified
    }
}

// MARK: - Encode/decode helpers

public class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
            return true
    }

    public var hashValue: Int {
            return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if !container.decodeNil() {
                    throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
            }
    }

    public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encodeNil()
    }
}
