//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Vitor Capretz on 2019-07-30.
//  Copyright © 2019 Vitor Capretz. All rights reserved.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var mode
    @State var profile = Profile.default
    @State var draftProfile = Profile.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Spacer()
                
                EditButton()
            }
            
            if self.mode?.value == .inactive {
                ProfileSummary(profile: profile)
            } else {
                Text("Edit mode")
            }
            
            
            if self.mode?.value == .active {
                Text("Active")
            } else if self.mode?.value == .inactive {
                Text("Inactive")
            } else if self.mode?.value == .transient {
                Text("transient")
            } else {
                Text("wtf")
            }
        }
        .padding()
    }
}

#if DEBUG
struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
    }
}
#endif
