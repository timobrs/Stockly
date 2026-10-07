import Foundation
import SwiftData

@Model
final class ShippingProfile {
    var id: UUID = UUID()
    var name: String = ""
    var priceInCents: Int64 = 0
    var isActive: Bool = true
    var sortOrder: Int = 0

    init(
        id: UUID = UUID(),
        name: String,
        priceInCents: Int64,
        isActive: Bool = true,
        sortOrder: Int = 0
    ) {
        self.id = id
        self.name = name
        self.priceInCents = priceInCents
        self.isActive = isActive
        self.sortOrder = sortOrder
    }
}
