//
//  ContentView.swift
//  FreeMealApp-ClaytonSulby-Fetch
//
//  Created by Clayton Sulby on 9/4/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    private let filter:String = "Dessert"
    @State private var filterResponse: FilterResponse?

    var body: some View {
        NavigationSplitView {
            MealList(filter: filter, meals: filterResponse?.meals ?? [])
        } detail: {
            Text("Select a meal")
        }
        .task {
            do {
                filterResponse = try await FreeMealAPI.getFilter(filter: filter)
            } catch {
                print(error)
            }
        }
    }
}

#Preview {
    ContentView()
}
