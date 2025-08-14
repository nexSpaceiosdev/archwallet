import SwiftUI
import UIKit

/// ArchWalletApp
/// The main entry point for the iOS application.
///
/// Responsibilities:
/// - Bootstraps the root view hierarchy
/// - Applies global appearance customizations (theme, tint, color scheme)
/// - Provides a single `WindowGroup` for SwiftUI lifecycle
@main
struct ArchWalletApp: App {
    init() {
        // Configure global UI appearance on app launch
        configureNavigationBarAppearance()
        configureTabBarAppearance()
    }
    
    /// NAVIGATION BAR APPEARANCE FIX
    /// Configures a centralized, global navigation bar appearance that ensures consistent
    /// title colors across all screens using our earthy brown theme color.
    private func configureNavigationBarAppearance() {
        // Create appearance configuration for all navigation bar states
        let navAppearance = UINavigationBarAppearance()
        navAppearance.configureWithTransparentBackground()
        navAppearance.backgroundColor = UIColor.clear // Let our background show through
        navAppearance.shadowColor = .clear // Remove default shadow
        
        // TITLE COLOR FIX: Set earthy brown (#A67B5B) for all title types
        // This ensures consistent branding across regular titles and large titles
        let earthyBrown = UIColor(red: 0.6510, green: 0.4824, blue: 0.3569, alpha: 1.0) // Theme.Brand.earthBrown
        navAppearance.titleTextAttributes = [
            .foregroundColor: earthyBrown,
            .font: UIFont.systemFont(ofSize: 17, weight: .semibold)
        ]
        navAppearance.largeTitleTextAttributes = [
            .foregroundColor: earthyBrown,
            .font: UIFont.systemFont(ofSize: 34, weight: .bold)
        ]
        
        // Apply to all navigation bar appearance states
        // This ensures the styling works in all scroll positions and contexts
        UINavigationBar.appearance().standardAppearance = navAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navAppearance
        UINavigationBar.appearance().compactAppearance = navAppearance
        UINavigationBar.appearance().tintColor = earthyBrown // For back buttons and bar button items
    }
    
    /// TAB BAR APPEARANCE FIX
    /// Configures tab bar to work with SwiftUI's toolbarBackground modifier
    private func configureTabBarAppearance() {
        // SIMPLIFIED: Let SwiftUI handle the tab bar background via toolbarBackground
        // Just ensure UIKit doesn't interfere with SwiftUI's background system
        let tabAppearance = UITabBarAppearance()
        tabAppearance.configureWithDefaultBackground()
        
        // Apply to all tab bar states
        UITabBar.appearance().standardAppearance = tabAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabAppearance
    }

    // MARK: - App Body

    var body: some Scene {
        WindowGroup {
            // SIMPLIFIED APPROACH: Use ZStack at the root level
            ZStack {
                // Background that definitely fills the entire screen
                Theme.background
                    .ignoresSafeArea(.all, edges: .all)
                
                // Main content
                MainTabView()
            }
                // Use light appearance per the new design system.
                .preferredColorScheme(.light)
                // Apply a global accent (tint) color for interactive elements and highlights.
                .tint(Theme.accent)
        }
    }
}

