import SwiftUI

/// DashboardView
/// Displays total balance, quick actions, and a list of assets.
struct DashboardView: View {
    @StateObject private var viewModel = DashboardViewModel()
    @State private var isPresentingBuySheet: Bool = false

    var body: some View {
        NavigationStack {
            ZStack {
                Theme.background.ignoresSafeArea()

                VStack(alignment: .leading, spacing: 16) {
                    // Total Balance
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Total Balance")
                            .foregroundColor(Theme.primaryText.opacity(0.6))
                            .font(.subheadline)
                        Text(formattedCurrency(viewModel.totalBalance))
                            .foregroundColor(Theme.primaryText)
                            .font(.system(size: 36, weight: .bold, design: .default))
                    }

                    // Quick Actions
                    HStack(spacing: 12) {
                        Button(action: { isPresentingBuySheet = true }) {
                            Text("Buy")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Theme.accent)
                                .cornerRadius(14)
                        }

                        Button(action: { /* TODO: implement send flow */ }) {
                            Text("Send")
                                .font(.headline)
                                .foregroundColor(Theme.primaryText)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 14, style: .continuous)
                                        .fill(Theme.background.opacity(0.85))
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 14, style: .continuous)
                                        .stroke(Color.white.opacity(0.08), lineWidth: 1)
                                )
                        }
                    }

                    // Assets List
                    List {
                        ForEach(viewModel.assets, id: \.ticker) { asset in
                            AssetRowView(asset: asset)
                                .listRowBackground(Theme.background)
                        }
                    }
                    .listStyle(.plain)
                }
                .padding(.horizontal, 16)
                .padding(.top, 16)
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
            .preferredColorScheme(.dark)
    }
}
#endif

