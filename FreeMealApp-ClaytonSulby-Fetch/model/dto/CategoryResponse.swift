// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - CategoryResponse
public struct CategoryResponse: Codable {
    public let categories: [CategoryItem]

    public init(categories: [CategoryItem]) {
        self.categories = categories
    }
}

// MARK: - Category
public struct CategoryItem: Codable, Hashable {
    public let strCategory: String

    public init(id: String, strCategory: String, strCategoryThumb: String, strCategoryDescription: String) {
        self.strCategory = strCategory
    }
    
    enum CodingKeys: String, CodingKey {
        case strCategory
    }
}
