//
//  Timer.swift
//  StudyRoom
//
//  Created by Max on 7/13/24.
//

import Foundation

extension TimerView {
    
    final class TimerModel: ObservableObject {
        @Published var isActive = false
        @Published var time: String = "10:00"
        @Published var showingAlert = false
        @Published var minutes: Double = 10.0 {         // user selected minutes
            didSet {
                self.time = "\(Int(minutes)):00"
            }
        }
        @Published var startTime = 0
        private var endDate = Date()
        
        // starts the timer
        func start(minutes: Double) {
            self.startTime = Int(minutes)
            self.endDate = Date()
            self.isActive = true
            self.endDate = Calendar.current.date(byAdding: .minute, value: Int(minutes), to: endDate)!
        }
        
        // reset timer
        func reset() {
            self.minutes = Double(startTime)
            self.isActive = false
            self.time = "\(Int(minutes)):00"
        }
        
        func updateCount() {
            guard isActive else { return }
            let now = Date()
            let diff = endDate.timeIntervalSince1970 - now.timeIntervalSince1970
            
            // when the timer has counted all the way down
            if diff <= 0 {
                self.isActive = false
                self.time = String(format: "%d:%02d", 0.00)
                self.showingAlert = true
                return
            }
            
            let date = Date(timeIntervalSince1970: diff)
            let calendar = Calendar.current
            let minutes = calendar.component(.minute, from: date)
            let seconds = calendar.component(.second, from: date)
            
            self.minutes = Double(minutes) // keep track of remaining minutes
            self.time = String(format: "%d:%02d", minutes, seconds) // formatting minutes and seconds to 2 decimal points
        }
    }
}
