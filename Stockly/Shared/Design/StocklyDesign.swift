import SwiftUI

enum StocklyDesign {
    enum Spacing {
        static let compact: CGFloat = 8
        static let standard: CGFloat = 12
        static let section: CGFloat = 20
        static let page: CGFloat = 24
    }

    enum CornerRadius {
        static let control: CGFloat = 10
        static let card: CGFloat = 16
    }

    enum Palette {
        static let success = Color.green
        static let warning = Color.orange
        static let destructive = Color.red
        static let secondaryText = Color.secondary
    }
}

extension Color {
    static var stocklyPrimary: Color {
        Color("BrandPrimary")
    }
}

private struct StocklyCardModifier: ViewModifier {
    @Environment(\.colorScheme) private var colorScheme

    func body(content: Content) -> some View {
        content
            .padding(StocklyDesign.Spacing.section)
            .background {
                RoundedRectangle(cornerRadius: StocklyDesign.CornerRadius.card, style: .continuous)
                    .fill(Color.primary.opacity(colorScheme == .dark ? 0.08 : 0.04))
            }
            .overlay {
                RoundedRectangle(cornerRadius: StocklyDesign.CornerRadius.card, style: .continuous)
                    .stroke(Color.primary.opacity(colorScheme == .dark ? 0.12 : 0.06))
            }
    }
}

extension View {
    func stocklyCard() -> some View {
        modifier(StocklyCardModifier())
    }
}
