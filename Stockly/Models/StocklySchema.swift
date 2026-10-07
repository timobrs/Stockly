import SwiftData

enum StocklySchema {
    static let models: [any PersistentModel.Type] = [
        Article.self,
        InventoryUnit.self,
        Sale.self,
        ShippingProfile.self
    ]
}
