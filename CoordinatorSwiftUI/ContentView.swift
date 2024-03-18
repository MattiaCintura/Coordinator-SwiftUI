//
//  ContentView.swift
//  CoordinatorSwiftUI
//
//  Created by Mattia Cintura on 09/03/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var coordinator: Coordinator

    var body: some View {
        NavigationStack(path: $coordinator.navigationPath) {
            TabView(selection: $coordinator.selectedTab) {
                coordinator.build(page: .homepage)
                    .tabItem {
                        Label("Homepage", systemImage: "house")
                    }
                    .tag(Tab.homepage)

                coordinator.build(page: .search)
                    .tabItem {
                        Label("Search", systemImage: "magnifyingglass")
                    }
                    .tag(Tab.search)

                coordinator.build(page: .profile)
                    .tabItem {
                        Label("Profile", systemImage: "person")
                    }
                    .tag(Tab.profile)
            }
            .navigationTitle(coordinator.selectedTab.id.capitalized)
            .navigationDestination(for: Page.self) { page in
                coordinator.build(page: page)
                    .environmentObject(coordinator)
            }
            .sheet(item: $coordinator.sheet) { sheet in
                coordinator.build(sheet: sheet)
            }
            .fullScreenCover(item: $coordinator.fullScreenCover) { fullScreenCover in
                coordinator.build(fullScreenCover: fullScreenCover)
            }
        }
    }
}

struct HomepageView: View {
    @EnvironmentObject private var coordinator: Coordinator

    var body: some View {
        VStack {
            Text("Homepage")
            Button("Go to search") {
                coordinator.push(.settings)
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

struct SearchView: View {
    @EnvironmentObject private var coordinator: Coordinator

    var body: some View {
        VStack {
            Text("Search")
            Button("Go to profile") {
                coordinator.popToRoot()
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

struct ProfileView: View {
    @EnvironmentObject private var coordinator: Coordinator

    var body: some View {
        VStack {
            Text("Profile")
            Button("Go to homepage") {
                coordinator.push(.search)
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

struct SettingsView: View {
    @EnvironmentObject private var coordinator: Coordinator
    
    var body: some View {
        VStack {
            Text("Settings")
            Button("Action") {
                coordinator.push(.profile)
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(Coordinator.shared)
}
