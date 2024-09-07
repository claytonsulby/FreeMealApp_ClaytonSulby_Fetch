//
//  MealThumbnail.swift
//  FreeMealApp-ClaytonSulby-Fetch
//
//  Created by Clayton Sulby on 9/6/24.
//

import SwiftUI

struct MealThumbnail: View {
    let url:URL?

    var body: some View {
        AsyncImage(url: url) { image in
            image
                .image()
        } placeholder: {
            ProgressView()
        }
        .frame(minWidth: 0, maxWidth: UIScreen.main.bounds.width / 2, minHeight: 0, maxHeight: UIScreen.main.bounds.width / 2, alignment: .center)
        .aspectRatio(1, contentMode: .fit)
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
                RoundedRectangle(cornerRadius: 30)
                    .stroke(style: StrokeStyle(lineWidth: 0.1))
                    .foregroundColor(.secondary)
            )
            .cornerRadius(30)
            .frame(minWidth: 0, maxWidth: UIScreen.main.bounds.width / 2, minHeight: 0, maxHeight: .infinity, alignment: .center)
    }
}

#Preview {
    MealThumbnail(url: URL(string: "https://www.themealdb.com/images/media/meals/xqwwpy1483908697.jpg"))
}

