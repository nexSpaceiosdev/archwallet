import SwiftUI

/// ProfileView
/// A placeholder for user profile, settings, and account management.
struct ProfileView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Theme.background.ignoresSafeArea()

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
            }
            .navigationTitle("Profile")
            .toolbarTitleDisplayMode(.large)
        }
    }
}

#if DEBUG
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .preferredColorScheme(.dark)
    }
}
#endif

