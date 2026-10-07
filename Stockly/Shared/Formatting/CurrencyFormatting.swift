import Foundation

extension Int64 {
    var euroDecimal: Decimal {
        Decimal(self) / 100
    }

    var formattedEuro: String {
        euroDecimal.formatted(
            .currency(code: "EUR")
                .locale(Locale(identifier: "de_DE"))
        )
    }
}
