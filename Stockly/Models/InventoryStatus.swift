import Foundation

enum InventoryStatus: String, Codable, CaseIterable, Identifiable, Sendable {
    case inStock
    case reserved
    case sold
    case returned

    var id: String { rawValue }
}
