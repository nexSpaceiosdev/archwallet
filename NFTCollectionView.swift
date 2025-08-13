import SwiftUI

/// NFTCollectionView
/// A placeholder view representing the user's NFT collection.
/// Displays a large title until real gallery components are integrated.
struct NFTCollectionView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Theme.background.ignoresSafeArea()

                VStack(spacing: 12) {
                    Text("NFTs")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Theme.primaryText)

                    Text("Placeholder screen")
                        .font(.subheadline)
                        .foregroundColor(Theme.primaryText.opacity(0.6))
                }
                .padding()
            }
            .navigationTitle("NFTs")
            .toolbarTitleDisplayMode(.large)
        }
    }
}

#if DEBUG
struct NFTCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        NFTCollectionView()
            .preferredColorScheme(.dark)
    }
}
#endif

