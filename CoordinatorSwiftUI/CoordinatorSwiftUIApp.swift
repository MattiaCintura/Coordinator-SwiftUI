//
//  CoordinatorSwiftUIApp.swift
//  CoordinatorSwiftUI
//
//  Created by Mattia Cintura on 09/03/24.
//

import SwiftUI

@main
struct CoordinatorSwiftUIApp: App {
    @StateObject private var coordinator = Coordinator.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .environmentObject(coordinator)
    }
}
