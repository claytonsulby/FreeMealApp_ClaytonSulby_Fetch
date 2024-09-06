//
//  SwiftUIView.swift
//
//
//  Created by Clayton Sulby on 7/20/23.
//

import SwiftUI

public struct ExpandableModalSection<Content:View> : View {
    
    var title:String
    @State var showMore:Bool = false
    var shouldShowMore:Bool
    var content:(Binding<Bool>) -> Content
    
    public init(_ title:String, shouldShowMore:Bool = true, @ViewBuilder _ content: @escaping (Binding<Bool>) -> Content) {
        self.title = title
        self.shouldShowMore = shouldShowMore
        self.content = content
    }

    public var body : some View {
        
        VStack(alignment: .leading, spacing: 40.0){
            
            HStack{
                Text(title)
                    .fontWeight(.semibold)
                Spacer()
                if shouldShowMore {
                    SectionButton(title: "Show More", symbol: "chevron.right")
                        .onTapGesture {
                            withAnimation {
                                showMore.toggle()
                            }
                        }
                }
            }
            
            content(shouldShowMore ? .constant(false) : .constant(true))
            
            Divider()
            
        }.padding(.horizontal, 20.5)
            .padding(.vertical, 40)
            .sheet(isPresented: $showMore) {
                NavigationView {
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(alignment: .center, spacing: 20) {

                        content(.constant(true))
                            .foregroundColor(.secondary)
                            .padding(.horizontal, 20.5)
                        }
                    }.navigationTitle(title)
                    #if os(iOS)
                    .navigationBarTitleDisplayMode(.inline)
                        .navigationBarItems(
                            trailing:
                                Image(systemName: "xmark")
                                .foregroundColor(.primary)
                                .padding()
                                .onTapGesture {
                                    showMore.toggle()
                                }
                        )
                    #endif
                }
            }
    }
    
}

struct ExpandableModalSection_Previews: PreviewProvider {
    static var previews: some View {
        ExpandableModalSection("ExpandableModalSection") { isShowingMore in
            Text("Content")
        }
    }
}
