//
//  MotionAnimatIonView.swift
//  Africa
//
//  Created by MacBook Pro on 26/10/2026.
//

import SwiftUI

struct MotionAnimatIonView: View {
    
    // MARK: - PROPERTIES
    
    @State private var randomCircle = Int.random(in: 12...16)
    @State private var isAnimating: Bool = false
    
    // RANDOM COORDINATE
    func randomCoordinate(max: CGFloat) -> CGFloat {
        return CGFloat.random(in: 0...max)
    }
    // RANDOM SIZE
    func randomSize() -> CGFloat{
        return CGFloat(Int.random(in: 10...300))
        
    }
    // RANDOM SCALE
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    // RANDOM SPEED
    func randomSpeed() -> Double {
        return Double.random(in: 0.025...1)
    }
    //RANDOM DELAY
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0...randomCircle, id: \.self) {item in
                    Circle()
                        .foregroundStyle(.gray)
                        .opacity(0.15)
                        .frame(width: randomSize(), height: randomSize(), alignment: .center)
                        .scaleEffect(randomScale())
                        .position(
                            x: randomCoordinate(max: geometry.size.width),
                            y: randomCoordinate(max: geometry.size.height)
                        )
                        .animation(
                            Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                                .repeatForever()
                                .speed(randomSpeed())
                                .delay(randomDelay())
                         )
                        .onAppear(perform: {
                            isAnimating = true
                        })
                }
            }
            .drawingGroup()
  
        }
    }
}

#Preview {
    MotionAnimatIonView()
}
 
