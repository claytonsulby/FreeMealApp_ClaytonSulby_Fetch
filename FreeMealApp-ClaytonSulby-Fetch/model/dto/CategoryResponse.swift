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
public struct CategoryItem: Codable, Hashable, Identifiable {
    public let id, strCategory: String
    public let strCategoryThumb: String
    public let strCategoryDescription: String

    public init(id: String, strCategory: String, strCategoryThumb: String, strCategoryDescription: String) {
        self.id = id
        self.strCategory = strCategory
        self.strCategoryThumb = strCategoryThumb
        self.strCategoryDescription = strCategoryDescription
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "idCategory"
        case strCategory
        case strCategoryThumb
        case strCategoryDescription
    }
}
