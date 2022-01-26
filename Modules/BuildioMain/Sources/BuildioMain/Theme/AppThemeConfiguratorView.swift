//
//  ThemeConfiguratorView.swift
//  
//
//  Created by Sergey Khliustin on 10.12.2021.
//

import SwiftUI

private struct ThemeEnvironmentKey: EnvironmentKey {
    static var defaultValue: Theme = Theme.current
}

private struct ThemeUpdaterEnvironmentKey: EnvironmentKey {
    static var defaultValue: Binding<Theme> = .constant(Theme.current)
}

extension EnvironmentValues {
    var theme: Theme {
        get {
            self[ThemeEnvironmentKey.self]
        }
        set {
            self[ThemeEnvironmentKey.self] = newValue
        }
    }
    
    var themeUpdater: Binding<Theme> {
        get {
            self[ThemeUpdaterEnvironmentKey.self]
        }
        set {
            self[ThemeUpdaterEnvironmentKey.self] = newValue
        }
    }
}

struct AppThemeConfiguratorView<Content: View>: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var theme: Theme
    @State private var themeUpdater: Theme = Theme.current
    @ViewBuilder private let content: () -> Content
    private var forcedTheme: Binding<Theme>?
    
    init(forcedTheme: Binding<Theme>? = nil, _ content: @escaping () -> Content) {
        self.forcedTheme = forcedTheme
        _theme = State(initialValue: forcedTheme?.wrappedValue ?? Theme.current)
        self.content = content
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        content()
            .environment(\.theme, theme)
            .environment(\.themeUpdater, $themeUpdater)
            .accentColor(theme.accentColor)
            .foregroundColor(theme.textColor)
            .background(theme.background)
            .progressViewStyle(CircularInfiniteProgressViewStyle())
            .onChange(of: colorScheme, perform: { newValue in
                if forcedTheme == nil {
                    theme = Theme.theme(for: newValue)
                }
            })
            .onChange(of: themeUpdater, perform: { newValue in
                if forcedTheme == nil {
                    theme = newValue
                }
            })
            .onChange(of: forcedTheme?.wrappedValue, perform: { newValue in
                if let newValue = newValue {
                    theme = newValue
                }
            })
    }
}
