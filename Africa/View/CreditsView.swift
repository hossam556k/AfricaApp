//
//  CreditsView.swift
//  Africa
//
//  Created by MacBook Pro on 27/10/2026.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
            
            
            Text("""
    Copyright @Roboert petrees 
    All right reserverd 
    Better Apps less code 

    """)
            .font(.footnote)
            .multilineTextAlignment(.center)
        }
     
    }
}

#Preview {
    CreditsView()
}
