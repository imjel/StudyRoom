//
//  ProfileHost.swift
//  StudyRoom
//
//  Created by Max on 7/13/24.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var editMode
    @Environment(ModelData.self) var modelData
    @State private var draftProfile = Profile.default
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 20) {
            HStack {
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        // cancelling edit resets the draftProfile to the currently saved profile
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton()
            }
            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile)
            } else {
                ProfileEditor(profile: $draftProfile)
            
                    // editor brings up currently saved profile
                    .onAppear {
                        draftProfile = modelData.profile
                    }
                    // when editor is closed, changes from draftProfile are saved to data
                    .onDisappear {
                        modelData.profile = draftProfile
                    }
            }
        }
        .padding()
        Spacer()
    }
}

#Preview {
    ProfileHost()
        .environment(ModelData())
}
