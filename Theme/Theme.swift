import SwiftUI

/// Theme
/// Centralizes the app's color system to ensure consistency across screens and components.
///
/// Wirex-inspired palette (adapted for accessibility and iOS rendering):
/// - Background: near-black charcoal for depth and focus on content
/// - Primary Text: off-white for comfortable contrast in dark mode
/// - Accent: vibrant green for CTAs and highlights
enum Theme {
    /// A deep charcoal background for dark-first UI.
    static let background: Color = Color(red: 0.05, green: 0.06, blue: 0.07) // ~#0C1012

    /// Primary text color with high legibility on dark background.
    static let primaryText: Color = Color(red: 0.95, green: 0.96, blue: 0.97) // ~#F2F5F7

    /// Accent color for CTAs, interactive states, and highlights.
    static let accent: Color = Color(red: 0.00, green: 0.78, blue: 0.33) // ~Wirex-like green
}

