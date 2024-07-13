//
//  TimerSlider2.swift
//  StudyRoom
//
//  Created by Max on 8/8/24.
//

import SwiftUI

struct TimerSlider2: View {
    let progress = 0.33
    let diameter = 300.0
    
    private var rotationAngle: Angle {
        return Angle(degrees: (360.0 * progress))
    }
    
    
    var body: some View {
       ZStack {
            Color(.blue)
                .edgesIgnoringSafeArea(.all)
           VStack {
               ZStack {
                   
               }
            }
        
            
        }
    }
}

#Preview {
    TimerSlider2()
}
