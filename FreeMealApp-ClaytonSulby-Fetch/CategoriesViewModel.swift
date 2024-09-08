//
//  CategoriesViewModel.swift
//  FreeMealApp-ClaytonSulby-Fetch
//
//  Created by Clayton Sulby on 9/7/24.
//

import Foundation

@MainActor
public class CategoriesViewModel : ObservableObject {
    
    @Published private(set) var categories:[CategoryItem]?
    @Published private(set) var error:Error?
    @Published private(set) var isLoading:Bool = false
    
    init() {}
    
    public func fetchCategories() async {
        categories = nil
        error = nil
        isLoading = true
        let result = await FreeMealAPI.getCategories()
        switch result {
        case .success(let response):
            self.categories = response.categories
        case .failure(let error):
            self.error = error
        }
        isLoading = false
    }
}
