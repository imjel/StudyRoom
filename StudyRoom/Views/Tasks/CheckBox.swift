//
//  CheckBox.swift
//  StudyRoom
//
//  Created by Max on 8/13/24.
//

import Foundation
import SwiftUI

struct CheckBox: ToggleStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        
            HStack {

                RoundedRectangle(cornerRadius: 5.0)
                    .stroke(lineWidth: 5)
                    .foregroundStyle(Color.gray)
                    .frame(width: 35, height: 35)
                    .cornerRadius(5.0)
                    .overlay {
                        Image(systemName: configuration.isOn ? "checkmark" : "")
                            .font(.system(size: 25))
                            .foregroundStyle(.gray)
                    }
                    .onTapGesture {
                        withAnimation(.default) {
                            configuration.isOn.toggle()
                        }
                    }

                configuration.label

            }
        }
}
