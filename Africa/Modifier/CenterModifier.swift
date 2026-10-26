//
//  CenterModifier.swift
//  Africa
//
//  Created by MacBook Pro on 27/10/2026.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}

