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
public struct CategoryItem: Codable {
    public let idCategory, strCategory: String
    public let strCategoryThumb: String
    public let strCategoryDescription: String

    public init(idCategory: String, strCategory: String, strCategoryThumb: String, strCategoryDescription: String) {
        self.idCategory = idCategory
        self.strCategory = strCategory
        self.strCategoryThumb = strCategoryThumb
        self.strCategoryDescription = strCategoryDescription
    }
}
