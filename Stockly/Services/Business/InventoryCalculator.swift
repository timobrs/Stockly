import Foundation

enum InventoryCalculator {
    static func currentStock(in units: [InventoryUnit]) -> Int {
        units.lazy.filter { $0.status == .inStock }.count
    }

    static func inventoryValueInCents(in units: [InventoryUnit]) -> Int64 {
        units.lazy
            .filter { $0.status == .inStock }
            .reduce(0) { $0 + $1.purchasePriceInCents }
    }
}
