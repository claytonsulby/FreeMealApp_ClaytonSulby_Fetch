//
//  ContentView.swift
//  FreeMealApp-ClaytonSulby-Fetch
//
//  Created by Clayton Sulby on 9/4/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel:MealListViewModel = MealListViewModel()
    
    var body: some View {
        NavigationSplitView {
            MealList(filter: viewModel.filter, meals: viewModel.meals ?? [])
                .handleError(data: viewModel.meals, error: viewModel.error) {
                    await viewModel.fetchMeals()
                }
        } detail: {
            Text("Select a meal")
        }
        .task {
            await viewModel.fetchMeals()
        }
    }
}

#Preview {
    ContentView()
}
