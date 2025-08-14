import SwiftUI

/// Theme
/// Centralizes the app's color system to ensure consistency across screens and components.
///
/// Light, clean design system:
/// - Background: light off-white grey for a fresh canvas
/// - Text: strong near-black for primary, soft grey for secondary
/// - Accents: five-brand palette for CTAs, highlights, and semantic emphasis
enum Theme {
	// MARK: - Core Colors

	/// App background — light, off-white grey.
	/// Approx: #F5F6F8
	static let background: Color = Color(red: 0.9608, green: 0.9647, blue: 0.9725)

	/// Primary text — strong, near-black.
	/// Approx: #111827
	static let textPrimary: Color = Color(red: 0.0667, green: 0.0941, blue: 0.1529)

	/// Secondary text — softer grey for supportive content.
	/// Approx: #6B7280
	static let textSecondary: Color = Color(red: 0.4196, green: 0.4471, blue: 0.5020)

	// Backwards-compatible aliases
	static let primaryText: Color = textPrimary
	static let secondaryText: Color = textSecondary

	// MARK: - Accent Palette (Brand Colors)
	/// Five-brand accent palette with simple descriptive names.
	enum Brand {
		/// Soft Pink — #F4A8B9
		static let softPink: Color = Color(red: 0.9588, green: 0.6588, blue: 0.7255)

		/// Deep Purple — #8B5FBF
		static let deepPurple: Color = Color(red: 0.5451, green: 0.3725, blue: 0.7490)

		/// Red Orange — #D9381E
		static let redOrange: Color = Color(red: 0.8510, green: 0.2196, blue: 0.1176)

		/// Warm Gold — #FFC857
		static let warmGold: Color = Color(red: 1.0000, green: 0.7843, blue: 0.3412)

		/// Earth Brown — #A67B5B
		static let earthBrown: Color = Color(red: 0.6510, green: 0.4824, blue: 0.3569)
	}

	/// Default accent used for `.tint`, CTAs, and highlights.
	/// Uses Deep Purple by default; opt into other accents via `Theme.Brand.*`.
	static let accent: Color = Brand.deepPurple
}
