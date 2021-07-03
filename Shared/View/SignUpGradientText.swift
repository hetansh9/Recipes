//
//  SignUpGradientText.swift
//  Recipes
//
//  Created by Het Prajapati on 7/3/21.
//

import SwiftUI

struct SignUpGradientText: View {
    
    //MARK: - PROPERTIES
    var text: String = "Text here"
    
    //MARK: - VIEW
    var body: some View {
        Text(text)
            .gradientForeground(colors: [ Color("signupGradientText-1")])
    }
}

struct SignUpGradientText_Previews: PreviewProvider {
    static var previews: some View {
        SignUpGradientText()
    }
}
