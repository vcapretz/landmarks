//
//  UserData.swift
//  Landmarks
//
//  Created by Vitor Capretz on 2019-07-24.
//  Copyright © 2019 Vitor Capretz. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: BindableObject {
    let willChange = PassthroughSubject<Void, Never>()
    
    var showFavoritesOnly = false {
        willSet {
            willChange.send()
        }
    }
    var landmarks = landmarkData {
        willSet {
            willChange.send()
        }
    }
}
