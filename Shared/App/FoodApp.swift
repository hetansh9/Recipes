//
//  FoodApp.swift
//  Recipes
//
//  Created by Het Prajapati on 4/9/21.
//

import SwiftUI
import Firebase

@main
struct FoodApp: App {
    
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    @State private var showLaunchView: Bool = true
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @EnvironmentObject var user: UserStore
    
    var body: some Scene {
        WindowGroup {
            ZStack{
                if isOnboarding {
                    OnboardingView()
                }else{
                    MainView().environmentObject(UserStore())
                    
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

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions:
        [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    FirebaseApp.configure()
    return true
  }
}
