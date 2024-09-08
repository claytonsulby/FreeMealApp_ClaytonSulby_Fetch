//
//  SimpleSection.swift
//  FreeMealApp-ClaytonSulby-Fetch
//
//  Created by Clayton Sulby on 9/4/24.
//

import SwiftUI

public struct SimpleSection<Content:View> : View {
    
    var title:String
    var content:() -> Content
    
    public init(_ title:String, @ViewBuilder _ content: @escaping () -> Content) {
        self.title = title
        self.content = content
    }
    
    public var body : some View {
        
        VStack(alignment: .leading, spacing: 40.0){
            
            HStack{
                Spacer()
                Text(title)
                    .fontWeight(.semibold)
                Spacer()
            }
            
            content()
                .foregroundColor(.secondary)
                .padding(.horizontal, 20.5)
            
            Divider()
            
        }.padding(.horizontal, 20.5)
            .padding(.vertical, 40)
        
    }
    
}

#Preview {
    SimpleSection("SimpleSection") {
        Text("Content")
    }
}

