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
                NavigationLink(value: category.name) {
                    CategoriesListElement(url: URL(string: category.thumbnail),
                                          index: category.id,
                                          title: category.name,
                                          subtitle: category.description)
                }
            }
            .handleError(data: viewModel.categories, error: viewModel.error) {
                await viewModel.fetchCategories()
            }
            .navigationTitle("Categories")
            .listStyle(.plain)
            .navigationDestination(for: String.self) { category in
                MealsView(filter: category)
            }
            .onAppear {
                self.path.append("Dessert")
            }
            .task {
                guard (viewModel.categories == nil) else { return }
                await viewModel.fetchCategories()
            }
            .animation(.easeInOut, value: viewModel.isLoading)
        }
    }
}

#Preview {
    MainView()
}
