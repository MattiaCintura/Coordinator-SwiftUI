//
//  Coordinator.swift
//  CoordinatorSwiftUI
//
//  Created by Mattia Cintura on 09/03/24.
//

import SwiftUI

enum Tab: String, Identifiable {
    case homepage
    case search
    case profile
    case settings
    
    var id: String {
        self.rawValue
    }
}

enum Page: String, Identifiable {
    case homepage
    case search
    case profile
    case settings
    
    var id: String {
        self.rawValue
    }
}

enum Sheet: String, Identifiable {
    case homepage
    
    var id: String {
        self.rawValue
    }
}

enum FullScreenCover: String, Identifiable {
    case homepage
    
    var id: String {
        self.rawValue
    }
}

final class Coordinator: ObservableObject {
    static let shared = Coordinator()
    
    @Published var navigationPath: NavigationPath = .init()
    @Published var selectedTab: Tab = .homepage
    @Published var sheet: Sheet?
    @Published var fullScreenCover: FullScreenCover?
    
    private init() {  }
    
    func push(_ page: Page) -> Void {
        navigationPath.append(page)
    }
    
    func pop() -> Void {
        navigationPath.removeLast()
    }
    
    func popToRoot() -> Void {
        navigationPath = .init()
    }
    
    func present(sheet: Sheet) -> Void {
        self.sheet = sheet
    }
    
    func dismissSheet() -> Void {
        self.sheet = nil
    }
    
    func present(fullScreenCover: FullScreenCover) -> Void {
        self.fullScreenCover = fullScreenCover
    }
    
    func dismissFullScreenCover() -> Void {
        self.fullScreenCover = nil
    }
    
    func changeTab(_ tab: Tab) -> Void {
        self.selectedTab = tab
    }
}

extension Coordinator {
    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
        case .homepage:
            HomepageView()
        case .search:
            SearchView()
        case .profile:
            ProfileView()
        case .settings:
            SettingsView()
        }
    }

    @ViewBuilder
    func build(sheet: Sheet) -> some View {
        switch sheet {
        case .homepage:
            Text("Sheet")
        }
    }

    @ViewBuilder
    func build(fullScreenCover: FullScreenCover) -> some View {
        switch fullScreenCover {
        case .homepage:
            Text("FullScreenCover")
        }
    }
}
