import Foundation
import SwiftData

@Model
final class Article {
    var id: UUID = UUID()
    var name: String = ""
    var articleNumber: String = ""
    var createdAt: Date = Date()

    @Relationship(deleteRule: .nullify, inverse: \InventoryUnit.article)
    var inventoryUnits: [InventoryUnit]?

    init(
        id: UUID = UUID(),
        name: String,
        articleNumber: String = "",
        createdAt: Date = Date(),
        inventoryUnits: [InventoryUnit]? = nil
    ) {
        self.id = id
        self.name = name
        self.articleNumber = articleNumber
        self.createdAt = createdAt
        self.inventoryUnits = inventoryUnits
    }

    var currentStock: Int {
        InventoryCalculator.currentStock(in: inventoryUnits ?? [])
    }

    var inventoryValueInCents: Int64 {
        InventoryCalculator.inventoryValueInCents(in: inventoryUnits ?? [])
    }
}
