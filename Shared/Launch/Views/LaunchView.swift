//
//  LaunchView.swift
//  Recipes
//
//  Created by Het Prajapati on 6/20/21.
//

import Foundation
import SwiftUI

struct LaunchView: View {
    //MARK: - PROPERTIES
    @State private var loadingText: [String] = "Loading the App...".map {String ($0) }
    @State private var showLoadingText: Bool = false
    private let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @State private var counter: Int = 0
    @State private var loops: Int = 0
    @Binding var showLaunchView: Bool
    
    //MARK: - VIEW
    var body: some View {
        ZStack{
            
            Color.launch.background
                .ignoresSafeArea()
            
            Image("launchLogo")
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
            
            ZStack{
                if showLoadingText {
                    
                    HStack(spacing: 1){
                        ForEach(loadingText.indices) { index in
                            Text(loadingText[index])
                                .font(.headline)
                                .fontWeight(.heavy)
                                .foregroundColor(Color.launch.accent)
                                .offset(y: counter == index ? -5 : 0)
                                
                        }
                    }
                    .transition(AnyTransition.scale.animation(.easeIn))
                }
            }
            .offset(y: 70)
        }
        .onAppear(){
            showLoadingText.toggle()
        }
        .onReceive(timer, perform: { _ in
            withAnimation(.spring()){
                let lastIndex = loadingText.count - 1
                if counter == lastIndex {
                    counter = 0
                    loops += 1
                    if loops >= 2 {
                        showLaunchView = false
                    }
                } else {
                    counter += 1
                }
            }
        })
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView(showLaunchView: .constant(true))
    }
}

extension Color {
    
    static let launch = LaunchTheme()
}

struct LaunchTheme {
    let accent = Color("LaunchAccentColor")
    let background = Color("LaunchBackgroundColor")
}
