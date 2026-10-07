import SwiftData
import SwiftUI

struct ContentView: View {
    var body: some View {
#if os(macOS)
        MacAppView()
#else
        IOSAppView()
#endif
    }
}

#if os(macOS)
private struct MacAppView: View {
    @State private var selection: AppSection? = .dashboard

    var body: some View {
        NavigationSplitView {
            List(AppSection.allCases, selection: $selection) { section in
                Label(section.title, systemImage: section.systemImage)
                    .tag(section)
            }
            .navigationTitle("Stockly")
            .navigationSplitViewColumnWidth(min: 190, ideal: 220)
        } detail: {
            NavigationStack {
                destination(for: selection ?? .dashboard)
            }
        }
        .tint(.stocklyPrimary)
        .frame(minWidth: 760, minHeight: 520)
    }

    @ViewBuilder
    private func destination(for section: AppSection) -> some View {
        switch section {
        case .dashboard:
            DashboardView()
        case .inventory:
            InventoryView()
        case .settings:
            SettingsView()
        }
    }
}
#else
private struct IOSAppView: View {
    @State private var selection: AppSection = .dashboard

    var body: some View {
        TabView(selection: $selection) {
            NavigationStack {
                DashboardView()
            }
            .tabItem {
                Label(AppSection.dashboard.title, systemImage: AppSection.dashboard.systemImage)
            }
            .tag(AppSection.dashboard)

            NavigationStack {
                InventoryView()
            }
            .tabItem {
                Label(AppSection.inventory.title, systemImage: AppSection.inventory.systemImage)
            }
            .tag(AppSection.inventory)

            NavigationStack {
                SettingsView()
            }
            .tabItem {
                Label(AppSection.settings.title, systemImage: AppSection.settings.systemImage)
            }
            .tag(AppSection.settings)
        }
        .tint(.stocklyPrimary)
    }
}
#endif

#Preview {
    ContentView()
        .modelContainer(PreviewData.container)
}
