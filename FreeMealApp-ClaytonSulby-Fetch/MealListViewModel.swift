//
//  MealListViewModel.swift
//  FreeMealApp-ClaytonSulby-Fetch
//
//  Created by Clayton Sulby on 9/7/24.
//

import Foundation

public class MealListViewModel : ObservableObject {
    
    let filter:String
    let meals:[FilterItem]
    @Published public var selectedSortingScheme:String = "Name"
    @Published public var isAscending:Bool = true
    
    public let sortingSchemes:[String:(FilterItem, FilterItem) -> Bool] = [
        "Name":{ $0.name < $1.name },
        "Id":{ $0.id < $1.id }
    ]
    
    init(filter:String, meals:[FilterItem]) {
        self.filter = filter
        self.meals = meals
    }

    public func getSortedList() -> [FilterItem] {
        guard let sortingScheme = sortingSchemes[selectedSortingScheme] else {
            return meals.sorted(by: { $0.name < $1.name  })
        }
        
        let sortedList = meals.sorted(by: { sortingScheme($0, $1) })
        return isAscending ? sortedList : sortedList.reversed()
    }
    
    public func getThumbnailURL(_ meal: FilterItem) -> URL? {
        return URL(string: meal.thumbnail)
    }

}
