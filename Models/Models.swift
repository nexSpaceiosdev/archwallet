import Foundation

/// NFT
/// A minimal representation of a non-fungible token for the initial app scaffold.
///
/// Properties:
/// - id: A unique integer identifier (e.g., token ID)
/// - name: A human-readable name for the NFT
/// - imageURL: A remote URL string pointing to the NFT's media (image/animation)
struct NFT: Identifiable, Codable, Hashable {
    let id: Int
    let name: String
    let imageURL: String
}

/// CryptoAsset
/// A basic representation of a cryptocurrency or token balance.
///
/// Properties:
/// - name: Full asset name (e.g., "Ethereum", "ARCHMEND")
/// - ticker: Short ticker symbol (e.g., "ETH", "ARCHMEND")
/// - balance: Current balance for the user's wallet (e.g., 1.2345)
/// - logoName: Local asset name for the token's logo (e.g., an SF Symbol or asset catalog name)
struct CryptoAsset: Codable, Hashable {
    let name: String
    let ticker: String
    let balance: Double
    let logoName: String
}

