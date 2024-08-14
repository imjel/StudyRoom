//
//  TaskProgress.swift
//  StudyRoom
//
//  Created by Max on 7/25/24.
//

import SwiftUI

struct TaskProgress: View {
    
    var progress: Double
    var label: String
    var color: Color
    private let WIDTH: CGFloat = 300
    
    var body: some View {
        VStack {
            ZStack (alignment: .leading) {
                // background color for bar
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: WIDTH, height: 70)
                    .foregroundColor(Color.gray.opacity(0.5))
                // foreground color indicating progress
                RoundedRectangle(cornerRadius: 15)
                    .frame(width:CGFloat(progress) * WIDTH, height: 70)
                    .foregroundColor(color.opacity(0.6))
                
                // task label with percentage
                if progress <= 0.1 {
                    VStack {
                        Text(label)
                        Text(String(format: "%.0f%%", progress * 100))
                            .bold()
                    }
                    .frame(width: WIDTH)
                    .foregroundColor(Color.white)
                } else {
                    VStack {
                        Text(label)
                        Text(String(format: "%.0f%%", progress * 100))
                            .bold()
                    }
                    .frame(width: CGFloat(progress) * WIDTH)
                    .foregroundColor(Color.white)
                }
            }
            .padding()
        }
    }
}

#Preview {
    TaskProgress(progress: 0.75, label: "study", color: Color.blue)
}
