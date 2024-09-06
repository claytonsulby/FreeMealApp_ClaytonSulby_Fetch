//
//  MealDetail.swift
//  FreeMealApp-ClaytonSulby-Fetch
//
//  Created by Clayton Sulby on 9/5/24.
//

import SwiftUI

struct MealDetail: View {
    
    let id:String
    @State var mealDetails:LookupResponse? = nil
    var meal:LookupItem? {
        mealDetails?.meals.first
    }
    
    var ingredients:[String] {
        guard let meal = meal else {return [] }
        let ingredients:[String?] = [meal.strIngredient1,
                                     meal.strIngredient2,
                                     meal.strIngredient3,
                                     meal.strIngredient4,
                                     meal.strIngredient5,
                                     meal.strIngredient6,
                                     meal.strIngredient7,
                                     meal.strIngredient8,
                                     meal.strIngredient9,
                                     meal.strIngredient10,
                                     meal.strIngredient11,
                                     meal.strIngredient12,
                                     meal.strIngredient13,
                                     meal.strIngredient14,
                                     meal.strIngredient15,
                                     meal.strIngredient16,
                                     meal.strIngredient17,
                                     meal.strIngredient18,
                                     meal.strIngredient19,
                                     meal.strIngredient20]
        return ingredients
            .filter { $0 != nil && !$0!.isEmpty }
            .compactMap { $0 }
            .map { $0.capitalized(with: .autoupdatingCurrent) }
    }
    
    var measures:[String] {
        guard let meal = meal else {return [] }
        let measures:[String?] = [meal.strMeasure1,
                                  meal.strMeasure2,
                                  meal.strMeasure3,
                                  meal.strMeasure4,
                                  meal.strMeasure5,
                                  meal.strMeasure6,
                                  meal.strMeasure7,
                                  meal.strMeasure8,
                                  meal.strMeasure9,
                                  meal.strMeasure10,
                                  meal.strMeasure11,
                                  meal.strMeasure12,
                                  meal.strMeasure13,
                                  meal.strMeasure14,
                                  meal.strMeasure15,
                                  meal.strMeasure16,
                                  meal.strMeasure17,
                                  meal.strMeasure18,
                                  meal.strMeasure19,
                                  meal.strMeasure20]
        return measures
            .filter { $0 != nil && !$0!.isEmpty }
            .compactMap { $0 }
            .map { $0.capitalized(with: .autoupdatingCurrent) }
    }
    
    var combined:[(String, String)] {
        Array(zip(ingredients, measures))
    }
    
    var body: some View {
        ScrollView {
            VStack{
                MealThumbnail(url: URL(string: meal?.strMealThumb ?? ""))

                HStack{
                    Text(meal?.strMeal ?? "Meal")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    Spacer()
                }.padding(.horizontal, 20.5)
                
                ExpandableModalSection("Instructions") { isExpanded in
                    Text((meal?.strInstructions ?? "") + "\(isExpanded.wrappedValue ? "" : "...")")
                        .lineLimit(isExpanded.wrappedValue ? nil : 3)
                }
                
                SimpleSection("Ingredients") {
                    ingredientsGrid()
                }
            }
        }.navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
            .task {
                do {
                    mealDetails = try await FreeMealAPI.getLookup(id: id)
                } catch {
                    print(error)
                }
            }
    }
    
    private func ingredientsGrid() -> some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 150), alignment: .leading), GridItem(.adaptive(minimum: 150), alignment: .leading)], content: {
            ForEach(combined, id:\.0) { ingredient, measure in
                Text(ingredient)
                Text(measure)
            }
            .foregroundColor(.primary)
        })
    }
}



#Preview {
    MealDetail(id: "52792")
}
