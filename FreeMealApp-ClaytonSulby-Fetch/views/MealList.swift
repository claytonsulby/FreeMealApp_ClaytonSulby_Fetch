//
//  FilterList.swift
//  FreeMealApp-ClaytonSulby-Fetch
//
//  Created by Clayton Sulby on 9/5/24.
//

import SwiftUI

struct MealList: View {
    
    var filter:String
    var meals:[FilterItem]
    
    var body: some View {
        List {
            ForEach(meals.sorted(by: { $0.strMeal < $1.strMeal })) { meal in
                NavigationLink {
                    MealDetail(id: meal.id)
                } label: {
                    MealListElement(url: getURL(meal), index: meal.id, subheadline: filter, title: meal.strMeal)
                }


            }
        }
        .listStyle(.plain)
    }
    
    private func getURL(_ meal: FilterItem) -> URL? {
        return URL(string: meal.strMealThumb)
    }
}

#Preview {
    MealList(filter: "Dessert", meals: [
        FilterItem(strMeal: "Bread and Butter Pudding", strMealThumb: "https://www.themealdb.com/images/media/meals/xqwwpy1483908697.jpg", id: "52792"),
        FilterItem(strMeal: "Apple & Blackberry Crumble", strMealThumb: "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg", id: "52893"),
    ])
}
