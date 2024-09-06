//
//  File.swift
//
//
//  Created by Clayton Sulby on 7/16/23.
//

import SwiftUI

public struct SectionButton : View {

    var title: String
    var symbol: String
    public var body: some View {
        HStack(spacing: 5){
            Text(title)
                .foregroundColor(.primary)
                .font(.subheadline)
                .kerning(-0.5)
            Image(systemName: symbol)
                .font(.system(.callout, design: .rounded))
                .foregroundColor(.secondary)
                .imageScale(.small)
        }
    }
    
}

#Preview {
    SectionButton(title: "Show More", symbol: "chevron.right")
}
