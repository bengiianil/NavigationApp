//
//  ContentView.swift
//  TabViewNavigation
//
//  Created by Bengi Anıl on 10.11.2024.
//

import SwiftUI

enum Tab: String {
    case first
    case second
}

struct MainView: View {
    @State private var activeTab: Tab = .first
    @State private var firstStack: NavigationPath = .init()
    @State private var secondStack: NavigationPath = .init()
    
    var body: some View {
        TabView(selection: tabSelection) {
            NavigationStack(path: $firstStack) {
                FirstView()
            }
            .tabItem {
                Label("First", systemImage: "1.circle")
            }
            
            NavigationStack(path: $secondStack) {
                SecondView()
            }
            .tabItem {
                Label("Second", systemImage: "2.circle")
            }
        }
        .onAppear {
            let standardAppearance = UITabBarAppearance()
            standardAppearance.configureWithDefaultBackground()
            UITabBar.appearance().standardAppearance = standardAppearance
            let scrollEdgeAppearance = UITabBarAppearance()
            scrollEdgeAppearance.configureWithDefaultBackground()
            UITabBar.appearance().scrollEdgeAppearance = scrollEdgeAppearance
        }
    }
    
    var tabSelection: Binding<Tab> {
        return .init {
            return activeTab
        } set: { newValue in
            if newValue == activeTab {
                switch newValue {
                case .first: firstStack = .init()
                case .second: secondStack = .init()
                }
            }
            activeTab = newValue
        }
    }
}

#Preview {
    MainView()
}
