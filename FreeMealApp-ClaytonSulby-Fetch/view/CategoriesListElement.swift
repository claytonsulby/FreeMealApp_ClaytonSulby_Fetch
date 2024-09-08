//
//  CategoriesListElement.swift
//  FreeMealApp-ClaytonSulby-Fetch
//
//  Created by Clayton Sulby on 9/7/24.
//

import SwiftUI

struct CategoriesListElement: View {
    let url:URL?
    let index:String
    let title:String
    let subtitle:String
    
    public var body : some View {
        
        HStack {
            Text(index)
                .index()

            AsyncImage(url: url) { image in
                image
                    .image()
            } placeholder: {
                ProgressView()
            }
            .asyncImage()

            VStack(alignment: .leading, spacing: 5.0){
                Text(title)
                    .title()
                Text(subtitle)
                    .subtitle()
            }
            Spacer()
        }.contentShape(Rectangle())
        
        
    }
}

fileprivate extension View {
    
    func index() -> some View {
        return self
            .font(.system(.body, design: .rounded).weight(.semibold))
            .foregroundColor(Color.secondary)
            .lineLimit(1)
            .minimumScaleFactor(0.5)
            .frame(minWidth: 0, maxWidth: 50, minHeight: 0, maxHeight: 100, alignment: .center)
            .aspectRatio(1, contentMode: .fit)
    }
    
    func subtitle() -> some View {
        return self
            .font(.caption2)
            .foregroundColor(.secondary)
            .lineLimit(2)
            .minimumScaleFactor(1)
            .multilineTextAlignment(.leading)
    }
    
}

fileprivate extension View {
    
    func title() -> some View {
        return self
            .foregroundColor(.primary)
            .lineLimit(3)
            .multilineTextAlignment(.leading)
    }
}

fileprivate extension Image {
    func image() -> some View {
        return self
            .resizable()
            .antialiased(false)
            .interpolation(.none)
            .aspectRatio(contentMode: .fit)
            .cornerRadius(5)
            .frame(minWidth: 0, maxWidth: 100, minHeight: 0, maxHeight: 100, alignment: .center)
    }
}

fileprivate extension AsyncImage {
    func asyncImage() -> some View {
        return self
            .frame(minWidth: 0, maxWidth: 100, minHeight: 0, maxHeight: 100, alignment: .center)
            .aspectRatio(1, contentMode: .fit)
    }
}
   

#Preview {
    CategoriesListElement(url: URL(string: "https://www.themealdb.com/images/category/dessert.png"),
                          index: "3", title: "Dessert", subtitle: "Dessert is a course that concludes a meal. The course usually consists of sweet foods, such as confections dishes or fruit, and possibly a beverage such as dessert wine or liqueur, however in the United States it may include coffee, cheeses, nuts, or other savory items regarded as a separate course elsewhere. In some parts of the world, such as much of central and western Africa, and most parts of China, there is no tradition of a dessert course to conclude a meal.\r\n\r\nThe term dessert can apply to many confections, such as biscuits, cakes, cookies, custards, gelatins, ice creams, pastries, pies, puddings, and sweet soups, and tarts. Fruit is also commonly found in dessert courses because of its naturally occurring sweetness. Some cultures sweeten foods that are more commonly savory to create desserts.")
}
