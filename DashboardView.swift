import SwiftUI

/// DashboardView
/// A placeholder screen for the main dashboard. Shows a large title as per the initial scaffold.
struct DashboardView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                // Use the global background color for a consistent dark theme.
                Theme.background.ignoresSafeArea()

                VStack(spacing: 12) {
                    Text("Dashboard")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Theme.primaryText)

                    Text("Placeholder screen")
                        .font(.subheadline)
                        .foregroundColor(Theme.primaryText.opacity(0.6))
                }
                .padding()
            }
            .navigationTitle("Dashboard")
            .toolbarTitleDisplayMode(.large)
        }
    }
}

#if DEBUG
struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
            .preferredColorScheme(.dark)
    }
}
#endif

