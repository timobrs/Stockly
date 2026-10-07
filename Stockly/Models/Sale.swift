import Foundation
import SwiftData

@Model
final class Sale {
    var id: UUID = UUID()
    var ebayOrderNumber: String?
    var orderDate: Date = Date()
    var salePriceInCents: Int64 = 0
    var buyerShippingInCents: Int64 = 0
    var ebayFeesInCents: Int64 = 0
    var actualShippingCostInCents: Int64 = 0
    var packagingCostInCents: Int64 = 0
    var refundInCents: Int64 = 0
    var createdAt: Date = Date()
    var inventoryUnit: InventoryUnit?

    init(
        id: UUID = UUID(),
        ebayOrderNumber: String? = nil,
        orderDate: Date,
        salePriceInCents: Int64,
        buyerShippingInCents: Int64 = 0,
        ebayFeesInCents: Int64 = 0,
        actualShippingCostInCents: Int64 = 0,
        packagingCostInCents: Int64 = 0,
        refundInCents: Int64 = 0,
        createdAt: Date = Date(),
        inventoryUnit: InventoryUnit? = nil
    ) {
        self.id = id
        self.ebayOrderNumber = ebayOrderNumber
        self.orderDate = orderDate
        self.salePriceInCents = salePriceInCents
        self.buyerShippingInCents = buyerShippingInCents
        self.ebayFeesInCents = ebayFeesInCents
        self.actualShippingCostInCents = actualShippingCostInCents
        self.packagingCostInCents = packagingCostInCents
        self.refundInCents = refundInCents
        self.createdAt = createdAt
        self.inventoryUnit = inventoryUnit
    }

    var amounts: SaleAmounts {
        SaleAmounts(
            salePriceInCents: salePriceInCents,
            buyerShippingInCents: buyerShippingInCents,
            ebayFeesInCents: ebayFeesInCents,
            actualShippingCostInCents: actualShippingCostInCents,
            packagingCostInCents: packagingCostInCents,
            refundInCents: refundInCents,
            purchasePriceInCents: inventoryUnit?.purchasePriceInCents ?? 0
        )
    }

    var revenueInCents: Int64 {
        SaleCalculator.revenueInCents(for: amounts)
    }

    var profitInCents: Int64 {
        SaleCalculator.profitInCents(for: amounts)
    }

    var profitMarginPercent: Decimal? {
        SaleCalculator.profitMarginPercent(for: amounts)
    }
}
