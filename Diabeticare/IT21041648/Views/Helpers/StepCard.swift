//
//  StepCard.swift
//  IT21041648
//
//  Created by Isuru Herath on 2024-06-07.
//

import SwiftUI

struct StepCard: View {
    
    var Steps : Int
    
    var body: some View {
        ZStack {
            Color(uiColor: .systemGray6)
                .cornerRadius (15)
            
            VStack {
                HStack(alignment: .top) {
                    VStack(alignment: .leading , spacing: 5) {
                        
                        
                        Text ("Daily steps")
                            .font (.system(size: 16))
                        Text ("Goal: 10,000")
                            .font(.system(size: 12))
                            .foregroundColor(.gray)
                    }
                    Spacer ()
                    Image (systemName: "figure.walk" )
                        .foregroundColor(.green)
                }
                        Text(String(Steps))
                    .font(.system(size: 24))
                    }
            .padding()
                }
                
            
        

    }
}

#Preview {
    StepCard( Steps: 123)
}
