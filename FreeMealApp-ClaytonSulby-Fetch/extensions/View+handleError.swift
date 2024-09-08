//
//  View+handleError.swift
//  FreeMealApp-ClaytonSulby-Fetch
//
//  Created by Clayton Sulby on 9/7/24.
//

import SwiftUI

struct HandleErrorViewModifier<T>: ViewModifier {
    
    let data:T?
    let error:Error?
    let retry:(() async -> Void)?
    
    func body(content: Content) -> some View {
        ZStack{
            if let _ = data {
                content
            } else if let error = error {
                ErrorView(error: error) {
                    if let retry = retry {
                        Task {
                            await retry()
                        }
                    }
                }
            } else {
                ProgressView()
            }
        }
    }
}

extension View {
    public func handleError<T>(data:T?, error:Error?, retry: @escaping () async -> Void) -> some View {
        return self
            .modifier(HandleErrorViewModifier(data: data, error: error, retry: retry))
    }
}
