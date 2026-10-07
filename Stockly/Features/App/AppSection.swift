import Foundation

enum AppSection: String, CaseIterable, Hashable, Identifiable {
    case dashboard
    case inventory
    case settings

    var id: Self { self }

    var title: String {
        switch self {
        case .dashboard:
            "Dashboard"
        case .inventory:
            "Inventar"
        case .settings:
            "Einstellungen"
        }
    }

    var systemImage: String {
        switch self {
        case .dashboard:
            "chart.xyaxis.line"
        case .inventory:
            "shippingbox"
        case .settings:
            "gearshape"
        }
    }
}
