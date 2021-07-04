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
    @State private var counter: Int = 0
    @State private var loops: Int = 0
    @Binding var showLaunchView: Bool
    
    private let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    //MARK: - VIEW
    var body: some View {
        
        ZStack{
                LinearGradient(gradient: Gradient(colors: [
                                                    Color.hexStringToColor(hex: "#FDEFF9"),
                                                    Color.hexStringToColor(hex: "#EC38BC"),
                                                    Color.hexStringToColor(hex: "#7303C0"),
                                                    Color.hexStringToColor(hex: "#03001E")]),
                               startPoint: .top,
                               endPoint: .bottom)
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
                    .transition(AnyTransition.scale.animation(.easeIn(duration: 0.5)))
                }
            }
            .offset(y: 70)
        }
        .onAppear(){
            withAnimation(){
                showLoadingText.toggle()
            }
        }
        .onReceive(timer, perform: { _ in
            withAnimation(.spring()){
                let lastIndex = loadingText.count - 1
                if counter == lastIndex {
                    counter = 0
                    loops += 1
                    if loops >= 2 {
                        withAnimation() {
                            showLaunchView = false
                        }   
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

struct LaunchTheme {
    let accent = Color("LaunchAccentColor")
    let background = Color("LaunchBackgroundColor")
}
