//
//  SignUpTextFieldIcon.swift
//  Recipes
//
//  Created by Het Prajapati on 7/3/21.
//

import SwiftUI

struct SignUpTextFieldIcon: View {
    //MARK: - PROPERITES
    
    var iconName: String
    @Binding var currentlyEditing: Bool
    @Binding var passedImage: UIImage?
    @State private var colorAngle: Double = 0.0
    
    var gradient: [Color] = [
//        Color.init(red: 8/255, green: 1/255, blue: 1),
//        Color.init(red: 1, green: 21/255, blue: 238/255),
//        Color.init(red: 125/255, green: 1, blue: 227/255),
//        Color.init(red: 178/255, green: 1/255, blue: 1)
        Color.init(red: 207/255, green: 154/255, blue: 253/255),
        Color.init(red: 16/255, green: 27/255, blue: 46/255),
        Color.init(red: 34/255, green: 41/255, blue: 85/255),
    ]
    
    //MARK: - VIEW
    var body: some View {
        ZStack {
            VisualEffectBlur(blurStyle: .dark) {
                ZStack {
                    if currentlyEditing{
                        AngularGradient(
                            gradient: Gradient(colors: gradient),
                            center: .center,
                            angle: .degrees(colorAngle)
                        )
                        .blur(radius: 10.0)
                        .onAppear(){
                            withAnimation(.linear(duration: 5)){
                                self.colorAngle += 350
                            }
                        }
                    }
                    Color("tertiaryBackground")
                        .cornerRadius(12)
                        .opacity(0.8)
                        .blur(radius: 3.0)
                }
            }
        }
        .cornerRadius(12)
        .overlay(
            
            ZStack{
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.white, lineWidth: 1)
                    .blendMode(.overlay)
                if passedImage != nil {
                    Image(uiImage: passedImage!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 28, height: 28, alignment: .center)
                        .cornerRadius(8)
                } else {
                    Image(systemName: iconName)
                        .gradientForeground(colors: [Color("signupGradientText-1"), Color("signupGradientText-1")])
                        .font(.system(size: 17, weight: .medium))
                }
               
            }
        )
        .frame(width: 36, height: 36, alignment: .center)
        .padding([.vertical, .leading], 8)
    }
}

struct SignUpTextFieldIcon_Previews: PreviewProvider {
    static var previews: some View {
        SignUpTextFieldIcon(iconName: "key.fill", currentlyEditing: .constant(true), passedImage: .constant(nil))
    }
}
