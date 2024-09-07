//
//  CategoriesViewModel.swift
//  FreeMealApp-ClaytonSulby-Fetch
//
//  Created by Clayton Sulby on 9/7/24.
//

import Foundation

@MainActor
public class CategoriesViewModel : ObservableObject {
    
    @Published var categories:[CategoryItem]?
    @Published var error:Error?
    @Published var isLoading:Bool = false
    
    init() {}
    
    public func fetchCategories() async {
        categories = nil
        error = nil
        isLoading = true
        do {
            self.categories = try await FreeMealAPI.getCategories().categories
        } catch {
            self.error = error
        }
        isLoading = false
    }
}
