//
//  SignUpGradientButton.swift
//  Recipes
//
//  Created by Het Prajapati on 7/3/21.
//

import SwiftUI

struct SignUpGradientButton: View {
    //MARK: - PROPERTIES
    
    @State private var angle = 0.0
    
    var gradients: [Color] = [
        Color.init(red: 207/255, green: 154/255, blue: 253/255),
        Color.init(red: 16/255, green: 27/255, blue: 46/255),
        Color.init(red: 34/255, green: 41/255, blue: 85/255)

        
    ]
    
    var buttonTitle: String
    var buttonAction: () -> Void
    
    var body: some View {
        Button(action: buttonAction, label: {
            GeometryReader() {geometry in
                ZStack{
                    AngularGradient(gradient: Gradient(colors: gradients), center: .center, angle: .degrees(angle))
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
                    
                    SignUpGradientText(text: buttonTitle)
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
//
//struct SignUpGradientButton_Previews: PreviewProvider {
//    static var previews: some View {
//        SignUpGradientButton(buttonTitle: <#String#>, buttonAction: <#() -> Void#>)
//    }
//}
