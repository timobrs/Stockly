import Foundation

struct SaleAmounts: Equatable, Sendable {
    var salePriceInCents: Int64
    var buyerShippingInCents: Int64
    var ebayFeesInCents: Int64
    var actualShippingCostInCents: Int64
    var packagingCostInCents: Int64
    var refundInCents: Int64
    var purchasePriceInCents: Int64
}

enum SaleCalculator {
    static func revenueInCents(for amounts: SaleAmounts) -> Int64 {
        amounts.salePriceInCents
            + amounts.buyerShippingInCents
            - amounts.refundInCents
    }

    static func profitInCents(for amounts: SaleAmounts) -> Int64 {
        revenueInCents(for: amounts)
            - amounts.ebayFeesInCents
            - amounts.actualShippingCostInCents
            - amounts.packagingCostInCents
            - amounts.purchasePriceInCents
    }

    static func profitMarginPercent(for amounts: SaleAmounts) -> Decimal? {
        let revenue = revenueInCents(for: amounts)
        guard revenue != 0 else { return nil }

        return Decimal(profitInCents(for: amounts)) / Decimal(revenue) * 100
    }
}
