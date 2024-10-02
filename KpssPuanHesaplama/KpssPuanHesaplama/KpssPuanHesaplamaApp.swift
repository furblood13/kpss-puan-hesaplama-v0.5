//
//  KpssPuanHesaplamaApp.swift
//  KpssPuanHesaplama
//
//  Created by Furkan buğra karcı on 30.09.2024.
//

import SwiftUI



@main
struct KpssPuanHesaplamaApp: App {
    //başlığın ve altındaki yerlerin kaymaması için görünüm ile alakalı
    init () {
        let apparenceNav = UINavigationBarAppearance()
        apparenceNav.configureWithOpaqueBackground()
        UINavigationBar.appearance().standardAppearance = apparenceNav
        UINavigationBar.appearance().scrollEdgeAppearance = apparenceNav
        
        let apparenceTab = UITabBarAppearance()
        apparenceTab.configureWithOpaqueBackground()
        UITabBar.appearance().scrollEdgeAppearance=apparenceTab
        UITabBar.appearance().standardAppearance=apparenceTab
        
    }
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}
