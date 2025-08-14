import SwiftUI

/// NFTCardView
/// A reusable card component for displaying a single NFT's image and name.
///
/// Visual design (light theme):
/// - White card with rounded corners and a subtle shadow
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
                    Rectangle()
                        .fill(Theme.background)
                        .frame(maxWidth: .infinity)
                        .aspectRatio(1, contentMode: .fit)
                        .overlay(
                            ProgressView().tint(Theme.accent)
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity)
                        .aspectRatio(1, contentMode: .fit)
                        .clipped()
                        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                case .failure:
                    // Fallback if the image fails to load
                    Rectangle()
                        .fill(Theme.background)
                        .frame(maxWidth: .infinity)
                        .aspectRatio(1, contentMode: .fit)
                        .overlay(
                            Image(systemName: "photo")
                                .foregroundColor(Theme.primaryText.opacity(0.5))
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
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
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 14, style: .continuous)
                .fill(Color.white)
        )
        .shadow(color: Color.black.opacity(0.06), radius: 8, x: 0, y: 4)
    }
}

#if DEBUG
struct NFTCardView_Previews: PreviewProvider {
    static var previews: some View {
        NFTCardView(nft: NFT(id: 1, name: "Arch Genesis #1", imageURL: "https://picsum.photos/id/237/600/600"))
            .preferredColorScheme(.light)
            .padding()
            .background(Theme.background)
            .previewLayout(.sizeThatFits)
    }
}
#endif

