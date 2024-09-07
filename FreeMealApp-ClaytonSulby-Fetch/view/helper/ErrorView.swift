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
        SimpleSection("An Error Has Occurred") {
            Text(error.localizedDescription)
                .font(.monospaced(.caption)())
                .foregroundStyle(.secondary)
            retryButton()
        }
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
        .foregroundStyle(.primary)
        .background(Color.secondary
            .cornerRadius(10)
            .opacity(0.5))
    }
}

#Preview {
    ErrorView(error: URLError.init(.notConnectedToInternet)) {
        print("retried")
    }
}
