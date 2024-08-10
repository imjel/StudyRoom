//
//  TimerSlider.swift
//  StudyRoom
//
//  Created by Max on 8/8/24.
//

import SwiftUI

struct TimerSlider: View {
    
    @Binding var progress: Double
    @State var rotationAngle = Angle(degrees: 0)
    var minValue = 0.0
    var maxValue = 1.0
    
    init(value progress: Binding<Double>, in bounds: ClosedRange<Int> = 0...1) {
            self._progress = progress
            
            self.minValue = Double(bounds.first ?? 0)
            self.maxValue = Double(bounds.last ?? 1)
            self.rotationAngle = Angle(degrees: progressFraction * 360.0)
        }
        
    private var progressFraction: Double {
        return ((progress - minValue) / (maxValue - minValue))
    }
    
    private func changeAngle(location: CGPoint) {
        let vector = CGVector(dx: location.x, dy: -location.y)
        let angleRadians = atan2(vector.dx, vector.dy)
        let positiveAngle = angleRadians < 0.0 ? angleRadians + (2.0 * .pi) : angleRadians
        progress = positiveAngle / (2.0 * .pi) * maxValue
        progress = ((positiveAngle / (2.0 * .pi)) * (maxValue - minValue)) + minValue
        rotationAngle = Angle(radians: positiveAngle)
    }
    
    
    var body: some View {
        
        GeometryReader { gr in
            let radius = (min(gr.size.width, gr.size.height) / 2.0) * 0.9
            let sliderWidth = radius * 0.2
            
            VStack (spacing: 0) {
                ZStack {
                    Circle()
                        .stroke(Color(hue: 0, saturation: 0, brightness: 0.85), lineWidth: sliderWidth)
                    Circle()
                        .trim(from: 0, to: progressFraction)
                        .stroke(Color(.blue), style: StrokeStyle(lineWidth: sliderWidth, lineCap: .round)
                            )
                        .rotationEffect(Angle(degrees: -90))
                    Circle()
                        .fill(Color.white)
                        .frame(width: sliderWidth, height: sliderWidth)
                        .offset(y: -radius)
                        .rotationEffect(rotationAngle)
                        .gesture(
                            DragGesture(minimumDistance: 0.0)
                                .onChanged() { value in
                                    changeAngle(location: value.location)
                                }
                        )
                    }
                .frame(width: radius * 2.0, height: radius * 2.0, alignment: .center)
                .padding(radius * 0.11)
            }
            
            .onAppear {
                self.rotationAngle = Angle(degrees: progressFraction * 360.0)
            }

        }
        .padding()
        }
    }

#Preview {
    TimerSlider(value: .constant(0.33))
}
