import Foundation
import SwiftData

@Model
final class InventoryUnit {
    var id: UUID = UUID()
    var purchasePriceInCents: Int64 = 0
    var purchaseDate: Date = Date()
    var statusRawValue: String = InventoryStatus.inStock.rawValue
    var createdAt: Date = Date()

    var article: Article?

    @Relationship(deleteRule: .nullify, inverse: \Sale.inventoryUnit)
    var sale: Sale?

    init(
        id: UUID = UUID(),
        purchasePriceInCents: Int64,
        purchaseDate: Date,
        status: InventoryStatus = .inStock,
        createdAt: Date = Date(),
        article: Article? = nil,
        sale: Sale? = nil
    ) {
        self.id = id
        self.purchasePriceInCents = purchasePriceInCents
        self.purchaseDate = purchaseDate
        self.statusRawValue = status.rawValue
        self.createdAt = createdAt
        self.article = article
        self.sale = sale
    }

    var status: InventoryStatus {
        get { InventoryStatus(rawValue: statusRawValue) ?? .inStock }
        set { statusRawValue = newValue.rawValue }
    }
}
