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
        var ingredients:[String?] = [meal.strIngredient1,
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
        ingredients = ingredients.filter({ $0 != nil })
        return ingredients.compactMap({ $0 })
    }
    
    var measures:[String] {
        guard let meal = meal else {return [] }
        var measures:[String?] = [meal.strMeasure1,
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
        measures = measures.filter({ $0 != nil })
        return measures.compactMap({ $0 })
    }
    
    var body: some View {
        ScrollView {
            VStack{
                AsyncImage(url: URL(string: meal?.strMealThumb ?? "")) { image in
                    image
                        .image()
                } placeholder: {
                    ProgressView()
                }
                
                Section {
                    Text(meal?.strInstructions ?? "")
                } header: {
                    Text("Instructions")
                        .font(.title2)
                }
                
                Section {
                    HStack{
                        VStack{
                            ForEach(ingredients, id:\.self) { ingredient in
                                Text(ingredient)
                            }
                        }
                        VStack{
                            ForEach(measures, id:\.self) { measure in
                                Text(measure)
                            }
                        }
                    }
                } header: {
                    Text("Ingredients")
                        .font(.title2)
                }
                
            }
        }.navigationTitle(meal?.strMeal ?? "Meal")
            .task {
                do {
                    mealDetails = try await FreeMealAPI.getLookup(id: id)
                } catch {
                    print(error)
                }
            }
    }
}

fileprivate extension Image {
    func image() -> some View {
        return self
            .resizable()
            .antialiased(false)
            .interpolation(.none)
            .aspectRatio(contentMode: .fit)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(style: StrokeStyle(lineWidth: 0.1))
                    .foregroundColor(.secondary)
            )
            .cornerRadius(5)
            .frame(minWidth: 0, maxWidth: 100, minHeight: 0, maxHeight: 100, alignment: .center)
    }
}

#Preview {
    MealDetail(id: "52792")
}
