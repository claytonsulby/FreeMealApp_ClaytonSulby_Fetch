//
//  MealDetailViewModel.swift
//  FreeMealApp-ClaytonSulby-Fetch
//
//  Created by Clayton Sulby on 9/7/24.
//

import Foundation

@MainActor
public class MealDetailViewModel : ObservableObject {
    
    let id:String
    @Published var meal:LookupItem?
    
    init(id:String) {
        self.id = id
        self.meal = nil
    }
    
    public func fetchMeal() async {
        do {
            self.meal = try await FreeMealAPI.getLookup(id: id).meals.first
        } catch {
            print(error)
        }
    }
    
    public func getIngredients() -> [Ingredient] {
        guard let meal = meal else {return [] }
        
        let ingredients:[String] = [meal.strIngredient1,
                                    meal.strIngredient2,
                                    meal.strIngredient3,
                                    meal.strIngredient4,
                                    meal.strIngredient5,
                                    meal.strIngredient6,
                                    meal.strIngredient7,
                                    meal.strIngredient8,
                                    meal.strIngredient9,
                                    meal.strIngredient10,
                                    meal.strIngredient11,
                                    meal.strIngredient12,
                                    meal.strIngredient13,
                                    meal.strIngredient14,
                                    meal.strIngredient15,
                                    meal.strIngredient16,
                                    meal.strIngredient17,
                                    meal.strIngredient18,
                                    meal.strIngredient19,
                                    meal.strIngredient20]
            .filter { $0 != nil && !$0!.isEmpty }
            .compactMap { $0 }
            .map { $0.capitalized(with: .autoupdatingCurrent) }
        
        let measures:[String] = [meal.strMeasure1,
                                 meal.strMeasure2,
                                 meal.strMeasure3,
                                 meal.strMeasure4,
                                 meal.strMeasure5,
                                 meal.strMeasure6,
                                 meal.strMeasure7,
                                 meal.strMeasure8,
                                 meal.strMeasure9,
                                 meal.strMeasure10,
                                 meal.strMeasure11,
                                 meal.strMeasure12,
                                 meal.strMeasure13,
                                 meal.strMeasure14,
                                 meal.strMeasure15,
                                 meal.strMeasure16,
                                 meal.strMeasure17,
                                 meal.strMeasure18,
                                 meal.strMeasure19,
                                 meal.strMeasure20]
            .filter { $0 != nil && !$0!.isEmpty }
            .compactMap { $0 }
            .map { $0.capitalized(with: .autoupdatingCurrent) }
        
        return Array(zip(ingredients, measures))
            .map { Ingredient(ingredient: $0, measure: $1) }
    }
    
    public func getMealThumbnailURL() -> URL? {
        guard let meal = meal else { return nil }
        return URL(string: meal.strMealThumb)
    }
    
}
