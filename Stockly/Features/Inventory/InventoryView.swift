import SwiftUI

struct InventoryView: View {
    var body: some View {
        ScrollView {
            FeaturePlaceholder(
                systemImage: "shippingbox",
                title: "Noch keine Artikel",
                message: "Dein Inventar und die verfügbaren Einheiten erscheinen hier."
            )
            .padding(StocklyDesign.Spacing.page)
        }
        .navigationTitle("Inventar")
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {
                    // Die Erfassung folgt in Aufgabe 5.
                } label: {
                    Label("Artikel hinzufügen", systemImage: "plus")
                }
                .disabled(true)
            }
        }
    }
}

#Preview {
    NavigationStack {
        InventoryView()
    }
}
