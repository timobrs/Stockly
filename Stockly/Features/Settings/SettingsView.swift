import SwiftUI

struct SettingsView: View {
    var body: some View {
        ScrollView {
            FeaturePlaceholder(
                systemImage: "gearshape",
                title: "Stockly einrichten",
                message: "Versandarten und weitere Einstellungen werden hier verwaltet."
            )
            .padding(StocklyDesign.Spacing.page)
        }
        .navigationTitle("Einstellungen")
    }
}

#Preview {
    NavigationStack {
        SettingsView()
    }
}
