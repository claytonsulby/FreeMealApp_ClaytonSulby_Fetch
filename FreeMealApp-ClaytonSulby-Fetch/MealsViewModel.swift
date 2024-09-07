//
//  MealListViewModel.swift
//  FreeMealApp-ClaytonSulby-Fetch
//
//  Created by Clayton Sulby on 9/6/24.
//

import Foundation

@MainActor
public class MealsViewModel : ObservableObject {
    
    var filter:String
    @Published var meals:[FilterItem]?
    @Published var error:Error?
    @Published var isLoading:Bool = false
    
    init(filter:String) {
        self.filter = filter
    }
    
    public func fetchMeals() async {
        meals = nil
        error = nil
        isLoading = true
        do {
            self.meals = try await FreeMealAPI.getFilter(filter: filter).meals
        } catch {
            self.error = error
        }
        isLoading = false
    }
    
}
