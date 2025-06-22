//
//  chronosApp.swift
//  chronos
//
//  Created by Jintao Yu on 2025/6/18.
//

import SwiftUI

@main
struct MyApp: App {
    @NSApplicationDelegateAdaptor(ChronosAppDelegate.self) var appDelegate

    var body: some Scene {
        Settings {
            EmptyView()
        }
    }
}
