import SwiftUI

/// BuyView
/// MVP buy flow UI with mock inputs and actions. Integrates with `CircleService` in the future.
struct BuyView: View {
    enum AssetOption: String, CaseIterable, Identifiable {
        case eth = "ETH"
        case archmend = "ARCHMEND"
        var id: String { rawValue }
    }

    @State private var selectedAsset: AssetOption = .eth
    @State private var fiatAmount: String = ""

    var body: some View {
        NavigationStack {
            // LAYOUT FIX: Remove ZStack wrapper and redundant background (same pattern as other views)
            // Problem: ZStack was constraining the sheet presentation and could affect parent layout
            VStack(alignment: .leading, spacing: 20) {
                // Asset picker
                VStack(alignment: .leading, spacing: 8) {
                    Text("Select Asset")
                        .foregroundColor(Theme.primaryText.opacity(0.7))
                        .font(.subheadline)
                    Picker("Asset", selection: $selectedAsset) {
                        ForEach(AssetOption.allCases) { option in
                            Text(option.rawValue).tag(option)
                        }
                    }
                    .pickerStyle(.segmented)
                    .tint(Theme.accent)
                }

                // Fiat amount input styled like modern fintech input
                VStack(alignment: .leading, spacing: 8) {
                    Text("Amount (USD)")
                        .foregroundColor(Theme.primaryText.opacity(0.7))
                        .font(.subheadline)
                    HStack {
                        Text("$")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(Theme.primaryText.opacity(0.8))
                        TextField("0.00", text: $fiatAmount)
                            .keyboardType(.decimalPad)
                            .font(.title2)
                            .foregroundColor(Theme.primaryText)
                    }
                    .padding(14)
                    .background(
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .fill(Color.white)
                    )
                    .shadow(color: Color.black.opacity(0.06), radius: 8, x: 0, y: 4)
                }

                Spacer()

                // Continue button (no-op for now)
                Button(action: {
                    // TODO: Integrate with CircleService for quote and 3DS flow
                }) {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Theme.accent)
                        .cornerRadius(14)
                }
            }
            .padding(16)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .navigationTitle("Buy Crypto")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#if DEBUG
struct BuyView_Previews: PreviewProvider {
    static var previews: some View {
        BuyView()
            .preferredColorScheme(.light)
    }
}
#endif

