//
//  FoodApp.swift
//  Recipes
//
//  Created by Het Prajapati on 4/9/21.
//

import SwiftUI

@main
struct FoodApp: App {
    
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    @State private var showLaunchView: Bool = true
    
    var body: some Scene {
        WindowGroup {
            ZStack{
                if isOnboarding {
                    OnboardingView()
                }else{
                    MainView()
                    
                    ZStack{
                        if showLaunchView {
                            LaunchView(showLaunchView: $showLaunchView)
                                .transition(.move(edge: .leading))
                        }
                    }
                    .zIndex(2.0)
                }
            }
        }
    }
}
