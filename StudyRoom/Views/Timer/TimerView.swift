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
    private let width: Double = 350
    
    
    var body: some View {
        VStack {
            TimerSlider(value: $tm.minutes, in: 0...61)
                .frame(width: width, height: width)
            
            Text("\(tm.time)")
                .font(.system(size: 50))
                .padding()
                .frame(width: width)
                .alert("Done!", isPresented: $tm.showingAlert) {
<<<<<<< HEAD
                    Button("Complete", role: .cancel) {
=======
                    Button("Close", role: .cancel) {
>>>>>>> 51faa3a (timer updates)
                        // functionality to cancel
                    }
            }
            
            HStack (spacing: 80) {
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
