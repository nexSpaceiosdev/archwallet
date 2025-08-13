import SwiftUI

/// AssetRowView
/// Reusable row to represent a `CryptoAsset` with logo, name/ticker, and balance.
struct AssetRowView: View {
    let asset: CryptoAsset

    var body: some View {
        HStack(spacing: 12) {
            // Placeholder logo using SF Symbol; replace with brand/logo asset when available.
            ZStack {
                Circle()
                    .fill(Theme.background.opacity(0.9))
                    .frame(width: 40, height: 40)
                Image(systemName: asset.logoName.isEmpty ? "bitcoinsign.circle" : asset.logoName)
                    .foregroundColor(Theme.accent)
            }

            VStack(alignment: .leading, spacing: 2) {
                Text(asset.name)
                    .foregroundColor(Theme.primaryText)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text(asset.ticker)
                    .foregroundColor(Theme.primaryText.opacity(0.6))
                    .font(.caption)
            }
            Spacer()
            Text(formattedBalance(asset.balance, ticker: asset.ticker))
                .foregroundColor(Theme.primaryText)
                .font(.subheadline)
        }
        .padding(.vertical, 8)
    }

    private func formattedBalance(_ amount: Double, ticker: String) -> String {
        // Show up to 4 decimals for crypto amounts by default
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 4
        let number = NSNumber(value: amount)
        let amountString = formatter.string(from: number) ?? String(amount)
        return "\(amountString) \(ticker)"
    }
}

#if DEBUG
struct AssetRowView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            AssetRowView(asset: CryptoAsset(name: "Ethereum", ticker: "ETH", balance: 0.85, logoName: "hexagon.fill"))
            AssetRowView(asset: CryptoAsset(name: "ARCHMEND", ticker: "ARCHMEND", balance: 1250.0, logoName: "a.circle.fill"))
        }
        .environment(\.colorScheme, .dark)
    }
}
#endif

