import SwiftUI

/// NFTCollectionView
/// Displays the user's NFT collection in a responsive two-column grid.
///
/// Implementation details:
/// - Uses `NFTViewModel` as a `@StateObject` to own the NFT data lifecycle
/// - `ScrollView` + `LazyVGrid` for efficient, memory-friendly grid rendering
/// - `NFTCardView` renders individual items with async image loading and theming
struct NFTCollectionView: View {
    /// View model owning the NFT list. Created once per view lifecycle.
    @StateObject private var viewModel = NFTViewModel()

    /// Two-column adaptive grid suitable for phones in portrait.
    private let gridColumns: [GridItem] = [
        GridItem(.flexible(), spacing: 12, alignment: .top),
        GridItem(.flexible(), spacing: 12, alignment: .top)
    ]

    var body: some View {
        NavigationStack {
            ZStack {
                Theme.background.ignoresSafeArea()

                ScrollView {
                    LazyVGrid(columns: gridColumns, spacing: 12) {
                        ForEach(viewModel.nfts) { nft in
                            NFTCardView(nft: nft)
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
                }
            }
            .navigationTitle("NFTs")
            .navigationBarTitleDisplayMode(.large)
        }
        .onAppear {
            // Populate with mock data for now; replace with real fetch later.
            viewModel.fetchNFTs()
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

