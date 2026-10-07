import SwiftUI

struct FeaturePlaceholder: View {
    let systemImage: String
    let title: LocalizedStringKey
    let message: LocalizedStringKey

    var body: some View {
        VStack(spacing: StocklyDesign.Spacing.standard) {
            Image(systemName: systemImage)
                .font(.system(size: 34, weight: .medium))
                .foregroundStyle(Color.stocklyPrimary)
                .accessibilityHidden(true)

            Text(title)
                .font(.headline)
                .multilineTextAlignment(.center)

            Text(message)
                .font(.subheadline)
                .foregroundStyle(StocklyDesign.Palette.secondaryText)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: 440)
        .frame(maxWidth: .infinity, minHeight: 240)
        .stocklyCard()
    }
}
