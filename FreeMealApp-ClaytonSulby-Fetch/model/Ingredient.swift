//
//  Ingredient.swift
//  FreeMealApp-ClaytonSulby-Fetch
//
//  Created by Clayton Sulby on 9/7/24.
//

import Foundation

public struct Ingredient: Hashable, Identifiable {
    public let id:UUID = UUID()
    let ingredient:String
    let measure:String
}
