//
//  MainView.swift
//  FreeMealApp-ClaytonSulby-Fetch
//
//  Created by Clayton Sulby on 9/7/24.
//

import SwiftUI

struct MainView: View {
    
    @State private var path:NavigationPath
    
    init() {
        self._path = State(wrappedValue: NavigationPath())
    }
    
    var body: some View {
        NavigationStack(path: $path) {
            List(["Dessert", "Pasta"], id:\.self) { category in
                NavigationLink(value: category) {
                    Text("\(category)")
                }
            }
            .navigationDestination(for: String.self) { category in
                MealsView(filter: category)
            }
            .onAppear {
                if path.isEmpty {
                    path.append("Dessert")
                }
            }
        }
    }
}

#Preview {
    MainView()
}
