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
    @Published var meals:[FilterItem]
    
    init() {
        self.filter = "Dessert"
        self.meals = []
    }
    
    public func fetchMeals() async {
        do {
            self.meals = try await FreeMealAPI.getFilter(filter: filter).meals
        } catch {
            print(error)
        }
    }
    
}
