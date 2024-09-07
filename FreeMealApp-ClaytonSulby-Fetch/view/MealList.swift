//
//  FilterList.swift
//  FreeMealApp-ClaytonSulby-Fetch
//
//  Created by Clayton Sulby on 9/5/24.
//

import SwiftUI

struct MealList: View {
    
    @ObservedObject var viewModel:MealListViewModel
    
    init(filter:String, meals:[FilterItem]) {
        self._viewModel = ObservedObject(wrappedValue: MealListViewModel(filter: filter, meals: meals))
    }
    
    var body: some View {
        List(viewModel.getSortedList()) { meal in
            NavigationLink(value: meal.id) {
                MealListElement(url: viewModel.getThumbnailURL(meal), index: meal.id, subheadline: viewModel.filter, title: meal.strMeal)
            }
        }
        .navigationDestination(for: String.self, destination:{ MealDetail(id: $0) })
        .toolbar(content: {
            SortingSelection(isAscending: $viewModel.isAscending, 
                             selection: $viewModel.selectedSortingScheme,
                             options: viewModel.sortingSchemes)
        })
        .listStyle(.plain)
        .navigationTitle(viewModel.filter)
    }
}

#Preview {
    MealList(filter: "Dessert", meals: [
        FilterItem(strMeal: "Bread and Butter Pudding", strMealThumb: "https://www.themealdb.com/images/media/meals/xqwwpy1483908697.jpg", id: "52792"),
        FilterItem(strMeal: "Apple & Blackberry Crumble", strMealThumb: "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg", id: "52893"),
    ])
}
