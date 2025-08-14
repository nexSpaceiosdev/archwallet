import SwiftUI

/// DashboardView
/// Displays total balance, quick actions, and a list of assets.
struct DashboardView: View {
    @StateObject private var viewModel = DashboardViewModel()
    @State private var isPresentingBuySheet: Bool = false

    var body: some View {
        NavigationStack {
            // EDGE-TO-EDGE FIX: Apply background directly to the view content
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Balance Card
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Total Balance")
                            .foregroundColor(.white.opacity(0.9))
                            .font(.subheadline)
                        Text(formattedCurrency(viewModel.totalBalance))
                            .foregroundColor(.white)
                            .font(.system(size: 34, weight: .bold))
                    }
                    .padding(16)
                    .background(
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .fill(Theme.Brand.deepPurple)
                    )
                    .shadow(color: Color.black.opacity(0.08), radius: 12, x: 0, y: 6)

                    // Quick Actions
                    HStack(spacing: 12) {
                        Button(action: { isPresentingBuySheet = true }) {
                            HStack(spacing: 8) {
                                Image(systemName: "cart")
                                Text("Buy")
                            }
                            .font(.headline)
                            .foregroundColor(Theme.textPrimary)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 14)
                            .background(Theme.Brand.warmGold)
                            .cornerRadius(16)
                            .shadow(color: Color.black.opacity(0.06), radius: 8, x: 0, y: 4)
                        }

                        Button(action: { /* TODO: implement send flow */ }) {
                            HStack(spacing: 8) {
                                Image(systemName: "paperplane.fill")
                                Text("Send")
                            }
                            .font(.headline)
                            .foregroundColor(Theme.textPrimary)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 14)
                            .background(Theme.Brand.softPink)
                            .cornerRadius(16)
                            .shadow(color: Color.black.opacity(0.06), radius: 8, x: 0, y: 4)
                        }
                    }

                    // Assets as individual cards
                    LazyVStack(spacing: 12) {
                        ForEach(viewModel.assets, id: \.ticker) { asset in
                            AssetRowView(asset: asset)
                        }
                    }
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 16)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .navigationTitle("Dashboard")
            .navigationBarTitleDisplayMode(.large)
        }
        .onAppear { viewModel.fetchData() }
        .sheet(isPresented: $isPresentingBuySheet) {
            BuyView()
        }
    }

    private func formattedCurrency(_ amount: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "USD"
        return formatter.string(from: NSNumber(value: amount)) ?? "$0.00"
    }
}

#if DEBUG
struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
            .preferredColorScheme(.light)
    }
}
#endif

