//
//  ErrorView.swift
//  FreeMealApp-ClaytonSulby-Fetch
//
//  Created by Clayton Sulby on 9/7/24.
//

import SwiftUI

struct ErrorView: View {
    
    let error:Error
    let retry:(() -> Void)?
    
    init(error: Error) {
        self.error = error
        self.retry = nil
    }
    
    init(error: Error, retry: @escaping () -> Void) {
        self.error = error
        self.retry = retry
    }
    
    var body: some View {
        VStack{
            Text("An Error Has Occurred")
                .fontWeight(.semibold)
            Text(error.localizedDescription)
                .font(.monospaced(.caption)())
            retryButton()
        }
        .padding(.horizontal, 20.5)
    }

    private func retryButton() -> some View {
        Button(action: retry ?? {}) {
            HStack{
                Spacer()
                Text("Retry?")
                Spacer()
            }.padding()
        }
        .disabled(retry == nil)
        .foregroundColor(.primary)
        .background(Color.secondary
            .cornerRadius(10)
            .opacity(0.5))
        .padding(.top)
    }
}

#Preview {
    ErrorView(error: URLError.init(.notConnectedToInternet)) {
        print("retried")
    }
}
