//
//  ProfileEditor.swift
//  StudyRoom
//
//  Created by Max on 7/13/24.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile
    
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -100, to: profile.birthday)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.birthday)!
        return min...max
    }
    
    var body: some View {
        List {
            
            HStack {
                Text("Username")
                    .foregroundStyle(.primary)
                TextField("Username", text: $profile.username)
                    .foregroundStyle(.blue)
                    .multilineTextAlignment(.trailing)
            }
            
            Picker("Profile Picture", selection: $profile.photo) {
                ForEach(Profile.Photo.allCases) { photo in
                    Text(photo.rawValue).tag(photo)
                }
            }
            
            DatePicker(selection: $profile.birthday, in: dateRange, displayedComponents: .date){
            Text("Birthday")
            }
            
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable Notifications")
            }
            
        }
    }
}

#Preview {
    ProfileEditor(profile: .constant(.default))
}
