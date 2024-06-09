//
//  ActionItemMap.swift
//  IT21041648
//
//  Created by Isuru Herath on 2024-06-07.
//

import SwiftUI

struct ActionItemMap: View {
    var body: some View {
        VStack(alignment: .leading) {
            Image("map")
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text("Clinical Map")
                .foregroundStyle(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

#Preview {
    ActionItemMap()
}
