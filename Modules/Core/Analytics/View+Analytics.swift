//
//  View+Analytics.swift
//  Modules
//
//  Created by Sergii Khliustin on 18.03.2025.
//

import SwiftUI
import FirebaseAnalytics
import FirebaseCore

package extension View {
    @ViewBuilder
    func analyticsPage(_ screenName: String, screenClass: String? = nil) -> some View {
        if FirebaseApp.app() != nil {
            self.analyticsScreen(name: screenName, class: screenClass ?? screenName)
        } else {
            self
        }
    }
}
