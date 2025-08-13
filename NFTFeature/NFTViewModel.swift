import Foundation
import Combine

/// NFTViewModel
/// Observable view model that owns and manages a collection of `NFT` models for the UI layer.
///
/// Responsibilities:
/// - Expose an observable `nfts` array for SwiftUI views to render
/// - Provide a `fetchNFTs()` method (mock for now) to populate the data
/// - Serve as the future integration point for networking, caching, and pagination
final class NFTViewModel: ObservableObject {

    /// Published collection of NFTs to display in the grid UI.
    @Published var nfts: [NFT] = []

    /// Simulates fetching NFTs by populating the `nfts` array with sample data.
    /// In a future iteration, this would call a repository/service that talks to
    /// Ethereum endpoints or an indexer, applies privacy rules, and caches images.
    func fetchNFTs() {
        // NOTE: Using stable placeholder image URLs for scaffolding.
        // Replace with actual token metadata image URLs when integrating real data.
        let samples: [NFT] = [
            NFT(id: 1, name: "Arch Genesis #1", imageURL: "https://picsum.photos/id/237/600/600"),
            NFT(id: 2, name: "Arch Genesis #2", imageURL: "https://picsum.photos/id/238/600/600"),
            NFT(id: 3, name: "Arch Genesis #3", imageURL: "https://picsum.photos/id/239/600/600"),
            NFT(id: 4, name: "Arch Genesis #4", imageURL: "https://picsum.photos/id/240/600/600"),
            NFT(id: 5, name: "Arch Genesis #5", imageURL: "https://picsum.photos/id/241/600/600"),
            NFT(id: 6, name: "Arch Genesis #6", imageURL: "https://picsum.photos/id/242/600/600")
        ]

        nfts = samples
    }
}

