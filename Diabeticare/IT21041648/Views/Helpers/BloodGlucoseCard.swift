//
//  BloodGlucoseCard.swift
//  IT21041648
//
//  Created by Isuru Herath on 2024-06-07.
//

import SwiftUI

struct BloodGlucoseCard: View {
    var Glucose : Int
    
    var body: some View {
        ZStack {
            Color(uiColor: .systemGray6)
                .cornerRadius (15)
            
            VStack {
                HStack(alignment: .top) {
                    VStack(alignment: .leading , spacing: 5) {
                        
                        
                        Text ("Blood Sugar")
                            .font (.system(size: 14))
                        Text ("limit : 400")
                            .font(.system(size: 12))
                            .foregroundColor(.gray)
                    }
                    Spacer ()
                    Image (systemName: "thermometer.variable.and.figure.circle" )
                        .foregroundColor(.red)
                }
                        Text("\(Glucose) mg/dl")
                    .font(.system(size: 24))
                    }
            .padding()
                }
                
            
        

    }
}

#Preview {
    BloodGlucoseCard( Glucose: 120)
}
