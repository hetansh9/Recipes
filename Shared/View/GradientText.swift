//
//  GradientText.swift
//  Recipes
//
//  Created by Het Prajapati on 6/1/21.
//

import SwiftUI

struct GradientText: View {
    
    //MARK: - PROPERTIES
    var text: String = "Text here"
    
    //MARK: - VIEW
    var body: some View {
        Text(text)
            .gradientForeground(colors: [Color("pink-gradient-1"), Color("pink-gradient-2")])
    }
}

extension View {
    public func gradientForeground(colors: [Color]) -> some View {
        self
            .overlay(LinearGradient(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing))
            .mask(self)
    }
}
