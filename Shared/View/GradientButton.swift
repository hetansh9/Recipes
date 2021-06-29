//
//  GradientButton.swift
//  Recipes
//
//  Created by Het Prajapati on 6/1/21.
//

import SwiftUI

struct GradientButton: View {
    
    //MARK: - PROPERTIES
    
    @State private var angle = 0.0
    
    var gradient1: [Color] = [
        Color.init(red: 8/255, green: 1/255, blue: 1),
        Color.init(red: 1, green: 21/255, blue: 238/255),
        Color.init(red: 125/255, green: 1, blue: 227/255),
        Color.init(red: 178/255, green: 1/255, blue: 1)
//        Color.hexStringToColor(hex: "080194"),
//        Color.hexStringToColor(hex: "8B15EE"),
//        Color.hexStringToColor(hex: "7D87E3"),
//        Color.hexStringToColor(hex: "B2015F")
        
    ]
    
    var buttonTitle: String
    var buttonAction: () -> Void
    
    //MARK: - VIEW
    
    var body: some View {
        Button(action: buttonAction, label: {
            GeometryReader() {geometry in
                ZStack{
                    AngularGradient(gradient: Gradient(colors: gradient1), center: .center, angle: .degrees(angle))
                        .blendMode(.overlay)
                        .blur(radius: 8.0)
                        .mask(
                            RoundedRectangle(cornerRadius: 16.0)
                                .frame(height: 50)
                                .frame(maxWidth: geometry.size.width - 16)
                                .blur(radius: 8.0)
                        )
                        .onAppear(){
                            withAnimation(.linear(duration: 5)){
                                self.angle += 350
                            }
                        }
                    
                    GradientText(text: buttonTitle)
                        .font(.headline)
                        .frame(width: geometry.size.width - 16)
                        .frame(height: 50)
                        .background(
                            Color("tertiaryBackground")
                                .opacity(0.9)
                            
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 16.0)
                                .stroke(Color.white, lineWidth: 1.0)
                                .blendMode(.normal)
                                .opacity(0.7)
                        )
                        .cornerRadius(16.0)
                }
            }
            .frame(height: 50)
        })
    }
}


