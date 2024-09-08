//
//  MealsViewModel.swift
//  FreeMealApp-ClaytonSulby-Fetch
//
//  Created by Clayton Sulby on 9/6/24.
//

import Foundation

@MainActor
public class MealsViewModel : ObservableObject {
    
    public let filter:String
    @Published private(set) var meals:[FilterItem]?
    @Published private(set) var error:Error?
    @Published private(set) var isLoading:Bool = false
    
    init(filter:String) {
        self.filter = filter
    }
    
    public func fetchMeals() async {
        meals = nil
        error = nil
        isLoading = true
        let result = await FreeMealAPI.getFilter(filter: filter)
        switch result {
        case .success(let response):
            self.meals = response.meals
        case .failure(let error):
            self.error = error
        }
        isLoading = false
    }
    
}
