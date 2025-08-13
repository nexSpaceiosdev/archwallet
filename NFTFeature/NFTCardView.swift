import SwiftUI

/// NFTCardView
/// A reusable card component for displaying a single NFT's image and name.
///
/// Visual design:
/// - Rounded rectangle with subtle shadow to lift from the dark background
/// - AsyncImage to load remote NFT media with placeholders and error state
/// - Name label with primary text color below the image
struct NFTCardView: View {
    let nft: NFT

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Image area: keeps a square aspect for grid consistency
            AsyncImage(url: URL(string: nft.imageURL)) { phase in
                switch phase {
                case .empty:
                    // Skeleton placeholder while loading
                    ZStack {
                        Theme.background.opacity(0.6)
                        ProgressView()
                            .tint(Theme.accent)
                    }
                    .frame(maxWidth: .infinity)
                    .aspectRatio(1, contentMode: .fit)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity)
                        .aspectRatio(1, contentMode: .fit)
                        .clipped()
                case .failure:
                    // Fallback if the image fails to load
                    ZStack {
                        Theme.background.opacity(0.6)
                        Image(systemName: "photo")
                            .foregroundColor(Theme.primaryText.opacity(0.5))
                    }
                    .frame(maxWidth: .infinity)
                    .aspectRatio(1, contentMode: .fit)
                @unknown default:
                    EmptyView()
                }
            }

            // Name label
            Text(nft.name)
                .font(.footnote)
                .foregroundColor(Theme.primaryText)
                .lineLimit(1)
                .truncationMode(.tail)
        }
        .padding(10)
        .background(
            // Subtle elevated surface over dark background
            RoundedRectangle(cornerRadius: 14, style: .continuous)
                .fill(Theme.background.opacity(0.9))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 14, style: .continuous)
                .stroke(Color.white.opacity(0.05), lineWidth: 1)
        )
        .shadow(color: Color.black.opacity(0.25), radius: 8, x: 0, y: 4)
    }
}

#if DEBUG
struct NFTCardView_Previews: PreviewProvider {
    static var previews: some View {
        NFTCardView(nft: NFT(id: 1, name: "Arch Genesis #1", imageURL: "https://picsum.photos/id/237/600/600"))
            .preferredColorScheme(.dark)
            .padding()
            .background(Theme.background)
            .previewLayout(.sizeThatFits)
    }
}
#endif

