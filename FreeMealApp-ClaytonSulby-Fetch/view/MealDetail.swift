//
//  MealDetail.swift
//  FreeMealApp-ClaytonSulby-Fetch
//
//  Created by Clayton Sulby on 9/5/24.
//

import SwiftUI

struct MealDetail: View {
    
    @StateObject var viewModel:MealDetailViewModel
    
    init(id:String) {
        self._viewModel = StateObject(wrappedValue: MealDetailViewModel(id: id))
    }
    
    var body: some View {
        ScrollView {
            VStack{
                MealThumbnail(url: viewModel.getMealThumbnailURL())

                HStack{
                    Text(viewModel.meal?.strMeal ?? "Meal")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    Spacer()
                }.padding(.horizontal, 20.5)
                
                ExpandableModalSection("Instructions") { isExpanded in
                    Text((viewModel.meal?.strInstructions ?? "") + "\(isExpanded.wrappedValue ? "" : "...")")
                        .lineLimit(isExpanded.wrappedValue ? nil : 3)
                }
                
                SimpleSection("Ingredients") {
                    ingredientsGrid()
                }
            }
        }.navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
            .task {
                await viewModel.fetchMeal()
            }
    }
    
    private func ingredientsGrid() -> some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 150), alignment: .leading), GridItem(.adaptive(minimum: 150), alignment: .leading)], content: {
            ForEach(viewModel.getIngredients(), id:\.self) { ingredient in
                Text(ingredient.ingredient)
                Text(ingredient.measure)
            }
            .foregroundColor(.primary)
        })
    }
}



#Preview {
    MealDetail(id: "52894")
}
