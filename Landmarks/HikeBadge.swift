//
//  HikeBadge.swift
//  Landmarks
//
//  Created by Vitor Capretz on 2019-07-30.
//  Copyright © 2019 Vitor Capretz. All rights reserved.
//

import SwiftUI

struct HikeBadge: View {
    var name: String
    
    var body: some View {
        VStack(alignment: .center) {
            Badge()
                .frame(width: 300, height: 300)
                .scaleEffect(1.0 / 3.0)
                .frame(width: 100, height: 100)
            
            Text(name)
                .font(.caption)
                .accessibility(label: Text("Badge for \(name)"))
        }
    }
}

#if DEBUG
struct HikeBadge_Previews: PreviewProvider {
    static var previews: some View {
        HikeBadge(name: "First hike")
    }
}
#endif
