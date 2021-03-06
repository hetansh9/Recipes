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

struct GradientText_Previews: PreviewProvider {
    static var previews: some View {
        SignUpGradientText()
    }
}
