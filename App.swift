import SwiftUI

/// ArchWalletApp
/// The main entry point for the iOS application.
///
/// Responsibilities:
/// - Bootstraps the root view hierarchy
/// - Applies global appearance customizations (theme, tint, color scheme)
/// - Provides a single `WindowGroup` for SwiftUI lifecycle
@main
struct ArchWalletApp: App {

    // MARK: - App Body

    var body: some Scene {
        WindowGroup {
            // `MainTabView` is the primary navigation surface of the app.
            MainTabView()
                // Prefer a dark appearance to align with the Wirex-inspired design.
                .preferredColorScheme(.dark)
                // Apply a global accent (tint) color for interactive elements and highlights.
                .tint(Theme.accent)
                // Ensure a consistent background behind scroll views and tab bars.
                .background(Theme.background)
        }
    }
}

