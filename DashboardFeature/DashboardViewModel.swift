import Foundation

/// DashboardViewModel
/// Owns and prepares the data displayed on the Dashboard screen.
///
/// Responsibilities:
/// - Expose a list of user's assets for display
/// - Compute and expose the user's total portfolio value (mocked)
/// - Provide a `fetchData()` method to populate state (mock for MVP)
final class DashboardViewModel: ObservableObject {

    /// List of crypto assets to display in the dashboard.
    @Published var assets: [CryptoAsset] = []

    /// Total portfolio value in fiat (USD) for now.
    @Published var totalBalance: Double = 0.0

    /// Populates `assets` with mock data for ETH and ARCHMEND and computes the total fiat balance.
    /// In a future iteration, this method will retrieve live balances and prices.
    func fetchData() {
        // Mock asset balances (crypto units)
        let mockAssets: [CryptoAsset] = [
            CryptoAsset(name: "Ethereum", ticker: "ETH", balance: 0.85, logoName: "hexagon.fill"),
            CryptoAsset(name: "ARCHMEND", ticker: "ARCHMEND", balance: 1250.0, logoName: "a.circle.fill")
        ]

        // Mock USD price mapping
        let mockPricesUSD: [String: Double] = [
            "ETH": 3200.0,
            "ARCHMEND": 0.25
        ]

        // Compute fiat total
        let computedTotal = mockAssets.reduce(0.0) { partial, asset in
            let price = mockPricesUSD[asset.ticker] ?? 0.0
            return partial + (asset.balance * price)
        }

        // Publish results
        assets = mockAssets
        totalBalance = computedTotal
    }
}

