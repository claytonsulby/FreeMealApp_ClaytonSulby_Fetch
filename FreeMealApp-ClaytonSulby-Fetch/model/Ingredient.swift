//
//  Ingredient.swift
//  FreeMealApp-ClaytonSulby-Fetch
//
//  Created by Clayton Sulby on 9/7/24.
//

import Foundation

public struct Ingredient: Equatable, Hashable {
    let ingredient:String
    let measure:String
    
    public static func == (lhs: Ingredient, rhs: Ingredient) -> Bool {
        return lhs.ingredient == rhs.ingredient &&
        lhs.measure == rhs.measure
    }
}
