//
//  SettingsLabelView.swift
//  Recipes
//
//  Created by Het Prajapati on 5/21/21.
//

import SwiftUI

struct SettingsLabelView: View {
    
    var labelText: String
    var labelImage: String
    
    var body: some View {
        HStack {
            Text(labelText.uppercased())
            Spacer()
            Image(systemName: labelImage)
        }
    }
}

struct SettingsLabelView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsLabelView(labelText: "Recipes", labelImage: "info.circle")
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
