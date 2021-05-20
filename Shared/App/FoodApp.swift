//
//  Planet_ExplorerApp.swift
//  Planet Explorer
//
//  Created by Het Prajapati on 4/9/21.
//

import SwiftUI

@main
struct FoodApp: App {
    
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    
    var body: some Scene {
        WindowGroup {
            if isOnboarding {
                OnboardingView()
            }else{
                ContentView()
            }
        }
    }
}
