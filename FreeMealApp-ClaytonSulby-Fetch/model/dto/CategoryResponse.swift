// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let categoryResponse = try? JSONDecoder().decode(CategoryResponse.self, from: jsonData)

import Foundation

// MARK: - CategoryResponse
public struct CategoryResponse: Codable, Equatable {
    let categories: [CategoryItem]

    public init(categories: [CategoryItem] = []) {
        self.categories = categories
    }
    
    public static func == (lhs: CategoryResponse, rhs: CategoryResponse) -> Bool {
        return lhs.categories == rhs.categories
    }
}

// MARK: - CategoryItem
public struct CategoryItem: Codable, Hashable, Identifiable {
    public let id, name: String
    public let thumbnail: String
    public let description: String

    public init(id: String, name: String, thumbnail: String, description: String) {
        self.id = id
        self.name = name
        self.thumbnail = thumbnail
        self.description = description
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "idCategory"
        case name = "strCategory"
        case thumbnail = "strCategoryThumb"
        case description = "strCategoryDescription"
    }
}
