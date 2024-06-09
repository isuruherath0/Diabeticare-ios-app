//
//  ActionItemPredict.swift
//  IT21041648
//
//  Created by Isuru Herath on 2024-06-08.
//

import SwiftUI

struct ActionItemPredict: View {
    var body: some View {
        VStack(alignment: .leading) {
            Image("predict")
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text("Predict")
                .foregroundStyle(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

#Preview {
    ActionItemPredict()
}
