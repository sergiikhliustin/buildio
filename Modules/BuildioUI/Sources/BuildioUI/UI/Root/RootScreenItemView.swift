//
//  RootScreen.swift
//  Buildio (iOS)
//
//  Created by Sergey Khliustin on 25.11.2021.
//

import SwiftUI

struct RootScreenItemView: View {
    let type: RootScreenItemType
    
    init(_ type: RootScreenItemType) {
        self.type = type
    }
    
    var body: some View {
        switch type {
        case .builds:
            BuildsScreenView()
        case .apps:
            AppsScreenView()
        case .accounts:
            AccountsScreenView()
        case .profile:
            ProfileScreenView()
        case .activities:
            ActivitiesScreenView()
        case .debug:
            DebugScreenView()
        }
    }
}

struct RootScreenItemView_Previews: PreviewProvider {
    static var previews: some View {
        RootScreenItemView(.debug)
    }
}
