//
//  SwiftUIGuideApp.swift
//  SwiftUIGuide
//
//  Created by punky on 2021/02/12.
//

import SwiftUI

@main
struct SwiftUIGuideApp: App {
    
    @State var selectedTab = 1
    
    var body: some Scene {
        WindowGroup {
            TabView(selection: $selectedTab) {
                ContentView().tabItem {
                    Image(systemName: "flame.fill")
                }.tag(0)
                TabTwoView().tabItem{
                    Image(systemName: "leaf.fill")
                }.tag(1)
                TabThreeView().tabItem{
                    Image(systemName: "flame")
                }.tag(2)
                TabFourView().tabItem{
                    Image(systemName: "flame.fill")
                }.tag(3)
                TabFiveView().tabItem {
                    Image(systemName: "leaf.fill")
                }
            }
        }
    }
}
