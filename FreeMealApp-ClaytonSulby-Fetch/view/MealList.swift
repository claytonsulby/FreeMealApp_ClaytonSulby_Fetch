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
    
    //sorting state
    var sortingSchemes:[String:(FilterItem, FilterItem) -> Bool] = [
        "Name":{ $0.strMeal < $1.strMeal },
        "Id":{ $0.id < $1.id }
    ]
    @State var selectedSortingScheme:String = "Name"
    @State var isAscending:Bool = true
    
    var body: some View {
        List(getSortedList()) { meal in
            NavigationLink(value: meal.id) {
                MealListElement(url: getURL(meal), index: meal.id, subheadline: filter, title: meal.strMeal)
            }
        }
        .navigationDestination(for: String.self, destination:{ MealDetail(id: $0) })
        .toolbar(content: {
            sortSelection()
        })
        .listStyle(.plain)
        .navigationTitle(filter)
    }
    
    private func sortSelection() -> some View {
        Menu {
            Button(action: {
                withAnimation(.linear) { self.isAscending.toggle() }
            }) {
                Label((isAscending ? "Ascending" : "Descending"), systemImage: (isAscending ? "chevron.up" : "chevron.down"))
            }
            
            Section {
                ForEach(sortingSchemes.sorted(by: { $0.key < $1.key }), id:\.key) { name, predicate in
                    Button(action: {
                        withAnimation(.linear) { self.selectedSortingScheme = name }
                    }) {
                        if (self.selectedSortingScheme == name) {
                            Label(name, systemImage: "checkmark")
                        } else {
                            Text(name)
                        }
                    }
                }
            }
        } label: {
            HStack(spacing: 5.0){
                Text(selectedSortingScheme)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .id(selectedSortingScheme)
                Image(systemName: (isAscending ? "chevron.up" : "chevron.down"))
                    .imageScale(.small)
                    .font(Font.subheadline.weight(.semibold))
                    .id("\(isAscending)")
                
            }
        }
        .foregroundColor(.accentColor)
    }
    
    private func getSortedList() -> [FilterItem] {
        guard let sortingScheme = sortingSchemes[selectedSortingScheme] else {
            return meals.sorted(by: { $0.strMeal < $1.strMeal  })
        }
        
        let sortedList = meals.sorted(by: { sortingScheme($0, $1) })
        return isAscending ? sortedList : sortedList.reversed()
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
