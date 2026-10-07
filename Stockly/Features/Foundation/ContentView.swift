import SwiftData
import SwiftUI

struct ContentView: View {
    @Query(sort: \Article.createdAt) private var articles: [Article]

    var body: some View {
        NavigationStack {
            ContentUnavailableView {
                Label("Stockly", systemImage: "shippingbox")
            } description: {
                if articles.isEmpty {
                    Text("Das Datenmodell ist bereit.")
                } else {
                    Text("\(articles.count) Artikel gespeichert")
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(PreviewData.container)
}
