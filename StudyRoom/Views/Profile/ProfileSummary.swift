//
//  ProfileSummary.swift
//  StudyRoom
//
//  Created by Max on 7/13/24.
//

import SwiftUI

struct ProfileSummary: View {
    @EnvironmentObject var modelData: ModelData
    var profile: ProfileModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            ZStack {
                Circle()
                    .stroke(lineWidth:5)
                    .fill(.gray)
                    .frame(width: 100, height: 100)
                Text(profile.photo.rawValue).font(.system(size: 50))
            }
            Text(profile.username)
                .font(.title)
                .bold()
        }
        Divider()
        VStack(alignment: .leading, spacing: 20){
            HStack {
                Text("Notification Preference: \(profile.notifications ? "On" : "Off")")
                    .multilineTextAlignment(.trailing)
            }
            Text("Birthday: \(profile.birthday, style: .date)")
        }
        .padding()
    }
}

#Preview {
    ProfileSummary(profile: ProfileModel.default)
        .environmentObject(ModelData())
}
