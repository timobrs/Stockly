import SwiftUI

struct DashboardView: View {
    var body: some View {
        ScrollView {
            FeaturePlaceholder(
                systemImage: "chart.xyaxis.line",
                title: "Dein Geschäft auf einen Blick",
                message: "Umsatz, Gewinn und Inventarübersicht werden hier zusammengeführt."
            )
            .padding(StocklyDesign.Spacing.page)
        }
        .navigationTitle("Dashboard")
    }
}

#Preview {
    NavigationStack {
        DashboardView()
    }
}
