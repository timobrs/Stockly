import Foundation
import SwiftData

@MainActor
enum PreviewData {
    static let container: ModelContainer = {
        let configuration = ModelConfiguration(isStoredInMemoryOnly: true)

        do {
            let container = try ModelContainer(
                for: Schema(StocklySchema.models),
                configurations: configuration
            )
            let context = container.mainContext

            let article = Article(name: "Axgop Team Race Car", articleNumber: "TRC-001")
            let availableUnit = InventoryUnit(
                purchasePriceInCents: 1_990,
                purchaseDate: Date().addingTimeInterval(-86_400 * 14),
                article: article
            )
            let soldUnit = InventoryUnit(
                purchasePriceInCents: 1_590,
                purchaseDate: Date().addingTimeInterval(-86_400 * 30),
                status: .sold,
                article: article
            )
            let sale = Sale(
                ebayOrderNumber: "12-34567-89012",
                orderDate: Date().addingTimeInterval(-86_400 * 2),
                salePriceInCents: 4_999,
                buyerShippingInCents: 549,
                ebayFeesInCents: 612,
                actualShippingCostInCents: 499,
                packagingCostInCents: 50,
                inventoryUnit: soldUnit
            )
            soldUnit.sale = sale
            article.inventoryUnits = [availableUnit, soldUnit]

            let shippingProfile = ShippingProfile(
                name: "DHL Kleinpaket",
                priceInCents: 399
            )

            context.insert(article)
            context.insert(sale)
            context.insert(shippingProfile)
            try context.save()

            return container
        } catch {
            fatalError("Preview-Container konnte nicht erstellt werden: \(error)")
        }
    }()
}
