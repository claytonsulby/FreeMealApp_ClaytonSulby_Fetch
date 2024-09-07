//
//  ContentView.swift
//  FreeMealApp-ClaytonSulby-Fetch
//
//  Created by Clayton Sulby on 9/4/24.
//

import SwiftUI

struct MealsView: View {
    
    @StateObject var viewModel:MealsViewModel
    
    init(filter:String) {
        self._viewModel = StateObject(wrappedValue: MealsViewModel(filter: filter))
    }
    
    var body: some View {
        MealList(filter: viewModel.filter, meals: viewModel.meals ?? [])
            .handleError(data: viewModel.meals, error: viewModel.error) {
                await viewModel.fetchMeals()
            }
            .task {
                guard (viewModel.meals == nil) else { return }
                await viewModel.fetchMeals()
            }
            .animation(.easeInOut, value: viewModel.isLoading)
    }
}

#Preview {
    MealsView(filter: "Dessert")
}
