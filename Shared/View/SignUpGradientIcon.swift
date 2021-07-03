//
//  SignUpGradientIcon.swift
//  Recipes
//
//  Created by Het Prajapati on 7/3/21.
//

import SwiftUI

struct SignUpGradientIcon: View {
    //MARK: - PROPERTIES
    var icon: String = ""
    
    //MARK: - VIEW
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)), Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .mask(Image(icon)
                    .font(.system(size: 17)
                    )
            )
            .background(Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)))
            .frame(width: 36, height: 36)
            .mask(RoundedRectangle(cornerRadius: 12, style: .continuous))
            .overlay(RoundedRectangle(cornerRadius: 12, style: .continuous).stroke(lineWidth: 1).foregroundColor(.white).blendMode(.overlay))
    }
}

struct SignUpGradientIcon_Previews: PreviewProvider {
    static var previews: some View {
        SignUpGradientIcon()
    }
}
