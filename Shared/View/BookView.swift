//
//  BookView.swift
//  Recipes
//
//  Created by Hetansh on 6/30/21.
//

import SwiftUI

struct BookView: View {
    
    var typeData: Food
    
    var body: some View {
        
        HStack {
            Image(typeData.image)
                .renderingMode(.original)
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .shadow(color: Color(red:0, green:0, blue:0, opacity: 0.3), radius: 3, x: 2, y: 2)
                .background(
                    LinearGradient(gradient: Gradient(colors: typeData.gradientColors), startPoint: .top, endPoint: .bottom)
                )
                .cornerRadius(8)
            VStack(alignment: .leading, spacing: 5, content: {
                Text(typeData.title)
                    .font(.title2)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Text(typeData.headline)
                    .font(.caption)
                    .foregroundColor(Color.secondary)
            })
            
        }
        
    }
    
}

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        BookView(typeData: foodsData[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

