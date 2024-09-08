//
//  SortingSelection.swift
//  FreeMealApp-ClaytonSulby-Fetch
//
//  Created by Clayton Sulby on 9/7/24.
//

import SwiftUI

struct SortingSelection<T>: View {
    
    @Binding var isAscending:Bool
    @Binding var selection:String
    var options:[String:(T, T) -> Bool]
    var ascendingString:String { isAscending ? "Ascending" : "Descending" }
    var ascendingSymbol:String { isAscending ? "chevron.up" : "chevron.down" }
    
    var body: some View {
        Menu {
            Button(action: {
                withAnimation(.linear) { isAscending.toggle() }
            }) {
                Label(ascendingString, systemImage: ascendingSymbol)
            }
            
            Section {
                ForEach(options.sorted(by: { $0.key < $1.key }), id:\.key) { name, predicate in
                    Button(action: {
                        withAnimation(.linear) { selection = name }
                    }) {
                        if (selection == name) {
                            Label(name, systemImage: "checkmark")
                        } else {
                            Text(name)
                        }
                    }
                }
            }
        } label: {
            HStack(spacing: 5.0){
                Text(selection)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .id(selection)
                Image(systemName: ascendingSymbol)
                    .imageScale(.small)
                    .font(Font.subheadline.weight(.semibold))
                    .id("\(isAscending)")
                
            }
        }
        .foregroundColor(.accentColor)
    }
}

#Preview {
    let sortingSchemes:[String:(FilterItem, FilterItem) -> Bool] = [
        "Name":{ $0.name < $1.name },
        "Id":{ $0.id < $1.id }
    ]
    
    return SortingSelection(isAscending: .constant(true), 
                            selection: .constant("Name"),
                            options: sortingSchemes)
}
