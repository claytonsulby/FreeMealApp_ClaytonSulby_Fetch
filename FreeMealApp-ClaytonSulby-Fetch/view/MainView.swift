//
//  MainView.swift
//  FreeMealApp-ClaytonSulby-Fetch
//
//  Created by Clayton Sulby on 9/7/24.
//

import SwiftUI

struct MainView: View {
    
    @State private var path:NavigationPath
    @ObservedObject private var viewModel: CategoriesViewModel
    
    init() {
        self._path = State(wrappedValue: NavigationPath())
        self._viewModel = ObservedObject(wrappedValue: CategoriesViewModel())
    }
    
    var body: some View {
        NavigationStack(path: $path) {
            List(viewModel.categories ?? [], id:\.self) { category in
                NavigationLink(value: category) {
                    Text("\(category.strCategory)")
                }
            }
            .handleError(data: viewModel.categories, error: viewModel.error) {
                await viewModel.fetchCategories()
            }
            .navigationTitle("Categories")
            .navigationDestination(for: CategoryItem.self) { category in
                MealsView(filter: category.strCategory)
            }
            .task {
                guard (viewModel.categories == nil) else { return }
                await viewModel.fetchCategories()
                appendDesertPath()
            }
            .animation(.easeInOut, value: viewModel.isLoading)
        }
    }
    
    private func appendDesertPath() {
        guard let dessertCategory = viewModel.categories?.first(where: { category in
            category.strCategory == "Dessert"
        }) else { return }
        path.append(dessertCategory)
    }
}

#Preview {
    MainView()
}
