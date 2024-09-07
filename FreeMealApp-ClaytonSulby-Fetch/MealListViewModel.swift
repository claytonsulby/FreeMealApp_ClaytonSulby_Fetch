//
//  MealListViewModel.swift
//  FreeMealApp-ClaytonSulby-Fetch
//
//  Created by Clayton Sulby on 9/6/24.
//

import Foundation

@MainActor
public class MealListViewModel : ObservableObject {
    
    var filter:String
    @Published var meals:[FilterItem]?
    @Published var error:Error?
    
    init() {
        self.filter = "Dessert"
    }
    
    public func fetchMeals() async {
        do {
            self.meals = try await FreeMealAPI.getFilter(filter: filter).meals
        } catch {
            self.error = error
        }
    }
    
}
