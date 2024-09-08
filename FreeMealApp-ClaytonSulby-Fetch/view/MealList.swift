//
//  MealList.swift
//  FreeMealApp-ClaytonSulby-Fetch
//
//  Created by Clayton Sulby on 9/5/24.
//

import SwiftUI

struct MealList: View {
    
    @StateObject var viewModel:MealListViewModel
    
    init(filter:String, meals:[FilterItem]) {
        self._viewModel = StateObject(wrappedValue: MealListViewModel(filter: filter, meals: meals))
    }
    
    var body: some View {
        List(viewModel.getSortedList()) { meal in
            NavigationLink(value: meal) {
                MealListElement(url: viewModel.getThumbnailURL(meal), index: meal.id, subheadline: viewModel.filter, title: meal.name)
            }
        }
        .navigationDestination(for: FilterItem.self) {
            MealDetail(id: $0.id)
        }
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
        FilterItem(id: "52792", name: "Bread and Butter Pudding", thumbnail: "https://www.themealdb.com/images/media/meals/xqwwpy1483908697.jpg"),
        FilterItem(id: "52893", name: "Apple & Blackberry Crumble", thumbnail: "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg")
    ])
}
