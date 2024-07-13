//
//  TimerMenu.swift
//  StudyRoom
//
//  Created by Max on 8/8/24.
//

import SwiftUI

struct TimerView: View {
    @StateObject private var tm = TimerModel()
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    private let width: Double = 200
    
    
    var body: some View {
        VStack {
            ZStack {
                TimerSlider(value: $tm.progress)
                Text("\(tm.time)")
                    .font(.system(size: 50))
                    .padding()
                    .frame(width: width)
                    .alert("Done!", isPresented: $tm.showingAlert) {
                        Button("Complete", role: .cancel) {
                            // functionality to cancel
                        }
                }
            }
            
            HStack (spacing: 60) {
                Button("Start") {
                    tm.start(minutes: tm.minutes)
                }
                .disabled(tm.isActive)
                
                Button("Cancel", action: tm.reset)
                    .tint(.red)
            }
            .frame(width: width)
            
        }
        .onReceive(timer) { _ in
            tm.updateCount()
        }
    }
}

#Preview {
    TimerView()
}
