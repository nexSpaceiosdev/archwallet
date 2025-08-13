import SwiftUI

/// MainTabView
/// The app's primary navigation container.
///
/// Design goals:
/// - Keep navigation simple and thumb-friendly using a bottom `TabView`.
/// - Provide three clear entry points: Dashboard, NFTs, Profile.
/// - Use SF Symbols for recognizable, accessible icons.
struct MainTabView: View {

    // MARK: - Body

    var body: some View {
        TabView {
            // Dashboard Tab
            DashboardView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Dashboard")
                }

            // NFTs Tab
            NFTCollectionView()
                .tabItem {
                    Image(systemName: "photo.on.rectangle.angled")
                    Text("NFTs")
                }

            // Profile Tab
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }
        // Set a unified background that respects safe areas and tab bar translucency.
        .background(Theme.background.ignoresSafeArea())
    }
}

#if DEBUG
struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
            .preferredColorScheme(.dark)
    }
}
#endif

