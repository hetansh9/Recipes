//
//  PrimaryButton.swift
//  Recipes
//
//  Created by Het Prajapati on 6/26/21.
//

import SwiftUI

struct PrimaryButton: View {
    //MARK: - PROPERTIES
    @Environment(\.colorScheme) var colorSceme: ColorScheme
    var text: String = "Contact Support"
    
    //MARK: - VIEW
    var body: some View {
        if colorSceme == .light {
            lightModeButton
        } else {
            darkModeButton
        }
    }
    
    var lightModeButton: some View {
        VStack{
            Text(text)
                .font(.headline)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 50)
        .background(LinearGradient(gradient: Gradient(colors: [
                                                        Color.hexStringToColor(hex: "#D4619C"),
                                                        Color.hexStringToColor(hex: "#7303C0"),
                                                        Color.hexStringToColor(hex: "#7D05E6")]), startPoint: .leading, endPoint: .trailing))
        .overlay(
            RoundedRectangle(cornerRadius: 16.0)
                .stroke(Color.black, lineWidth: 5)
                .blendMode(.normal)
                .opacity(0.7)
        )
        .cornerRadius(16)
        .foregroundColor(.white)
    }
    
    var darkModeButton: some View {
        VStack{
            Text(text)
                .font(.headline)
            
        }
        .frame(maxWidth: .infinity)
        .frame(height: 50)
        .background(LinearGradient(gradient: Gradient(colors: [
                                                    
                                                        Color.hexStringToColor(hex: "#3412CD"),
                                                        Color.hexStringToColor(hex: "#79069B"),
                                                        Color.hexStringToColor(hex: "#3412CD"),
                                                       ]), startPoint: .leading, endPoint: .trailing))
        .overlay(
            RoundedRectangle(cornerRadius: 16.0)
                .stroke(Color.white, lineWidth: 5)
                .blendMode(.normal)
                .opacity(0.7)
        )
        .cornerRadius(16)
        .foregroundColor(.white)
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton()
    }
}
