//
//  Element.swift
//  FreeMealApp-ClaytonSulby-Fetch
//
//  Created by Clayton Sulby on 9/5/24.
//

import SwiftUI

struct Element: View {
    
    let url:URL?
    let index:String
    let subheadline:String
    let title:String
    
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
                VStack(alignment: .leading, spacing: 0.0){
                    Text(subheadline)
                        .subheadline()
                    HStack(alignment: .top, spacing: 5.0){
                        Text(title)
                            .title()
                    }
                }
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
    
    func subheadline() -> some View {
        if #available(iOS 16.0, macOS 13.0, *) {
            return self
                .fontWeight(.semibold)
                .font(Font.caption.smallCaps())
                .foregroundColor(.secondary)
        } else {
            return self
                .font(Font.caption.smallCaps())
                .foregroundColor(.secondary)
        }
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
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(style: StrokeStyle(lineWidth: 0.1))
                    .foregroundColor(.secondary)
            )
            .cornerRadius(5)
            .frame(minWidth: 0, maxWidth: 100, minHeight: 0, maxHeight: 100, alignment: .center)
    }
}

fileprivate extension AsyncImage {
    func asyncImage() -> some View {
        return self
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
    Element(url: URL(string: "https://www.themealdb.com/images/media/meals/xqwwpy1483908697.jpg"),
            index: "52792", subheadline: "Dessert", title: "Bread and Butter Pudding")
    .previewLayout(.sizeThatFits)
}
