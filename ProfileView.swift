import SwiftUI

/// ProfileView
/// A placeholder for user profile, settings, and account management.
struct ProfileView: View {
    var body: some View {
        NavigationStack {
            // LAYOUT FIX: Remove ZStack wrapper and redundant background
            // Problem: ZStack was creating an unnecessary container layer that prevented
            // the NavigationStack from properly expanding to fill the TabView space.
            VStack(spacing: 12) {
                Text("Profile")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Theme.primaryText)

                Text("Placeholder screen")
                    .font(.subheadline)
                    .foregroundColor(Theme.primaryText.opacity(0.6))
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#if DEBUG
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .preferredColorScheme(.light)
    }
}
#endif

