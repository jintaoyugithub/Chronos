//
//  ContentView.swift
//  chronos
//
//  Created by Jintao Yu on 2025/6/18.
//

import SwiftUI

struct MainView: View {
    @State private var selectedTab = 0

    var body: some View {
        VStack(spacing: 0) {
            // Tab Content
            Group {
                switch selectedTab {
                case 0:
                    HomeView()
                case 1:
                    ProfileView()
                default:
                    Text("Other View")
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            // Custom Bottom Tab Bar
            VStack {
                Button(action: { selectedTab = 0 }) {
                    Label("Home", systemImage: "house")
                        .frame(maxWidth: .infinity)
                }

                Button(action: { selectedTab = 1 }) {
                    Label("Profile", systemImage: "person.circle")
                        .frame(maxWidth: .infinity)
                }
            }
            .padding()
            .background(Material.bar) // macOS 12+
        }
        .frame(minWidth: 300, minHeight: 250)
    }
}

#Preview {
    MainView()
}
