//
//  EnvironmentConfiguratorView.swift
//  Buildio (iOS)
//
//  Created by Sergey Khliustin on 25.11.2021.
//

import SwiftUI

public enum WindowMode {
    case compact
    case split
}

private struct FullscreenEnvironmentKey: EnvironmentKey {
    static var defaultValue: Binding<Bool> = .constant(false)
}

private struct KeyboardEnvironmentKey: EnvironmentKey {
    static var defaultValue: Bool = false
}

private struct WindowModeEnvironmentKey: EnvironmentKey {
    static var defaultValue: WindowMode = .compact
}

private struct PreviewEnvironmentKey: EnvironmentKey {
    static var defaultValue: Bool = false
}

extension EnvironmentValues {
    var fullscreen: Binding<Bool> {
        get {
            self[FullscreenEnvironmentKey.self]
        }
        set {
            self[FullscreenEnvironmentKey.self] = newValue
        }
    }
    
    var keyboard: Bool {
        get {
            self[KeyboardEnvironmentKey.self]
        }
        set {
            self[KeyboardEnvironmentKey.self] = newValue
        }
    }
    
    var windowMode: WindowMode {
        get {
            self[WindowModeEnvironmentKey.self]
        }
        set {
            self[WindowModeEnvironmentKey.self] = newValue
        }
    }
    
    var previewMode: Bool {
        get {
            self[PreviewEnvironmentKey.self]
        }
        set {
            self[PreviewEnvironmentKey.self] = newValue
        }
    }
}

public struct EnvironmentConfiguratorView<Content: View>: View {
    @StateObject private var keyboard: KeyboardObserver = KeyboardObserver()
    @StateObject var navigators: Navigators
    @State private var fullscreen: Bool = false
    @State private var windowMode: WindowMode = .compact
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    
    @ViewBuilder let content: () -> Content
    
    private let previewMode: Bool
    
    private let activityWatcher: ActivityWatcher?
    private weak var screenFactory: ScreenFactory!
    private weak var tokenManager: TokenManager!
    
    init(previewMode: Bool = false, _ content: @escaping () -> Content) {
        self.previewMode = previewMode
        self.content = content
        
        let tokenManager = previewMode ? PreviewTokenManager() : TokenManager()
        let viewModelFactory = ViewModelFactory(tokenManager)
        let screenFactory = ScreenFactory(viewModelFactory)
        let navigators = Navigators(screenFactory)
        
        self.screenFactory = screenFactory
        self.tokenManager = tokenManager
        self.activityWatcher = ActivityWatcher(tokenManager)
        _navigators = StateObject(wrappedValue: navigators)
    }
    
    public var body: some View {
        content()
            .environment(\.previewMode, previewMode)
            .environment(\.fullscreen, $fullscreen)
            .environment(\.keyboard, keyboard.isVisible)
            .environment(\.windowMode, windowMode)
            .environmentObject(navigators)
            .environmentObject(screenFactory)
            .environmentObject(tokenManager)
            .onChange(of: horizontalSizeClass) { newValue in
                windowMode = previewMode ? .compact : (newValue == .compact ? .compact : .split)
            }
    }
}
