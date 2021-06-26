//
//  ProfileRow.swift
//  Recipes
//
//  Created by Het Prajapati on 6/26/21.
//

import SwiftUI

struct ProfileRow: View {
    var body: some View {
        HStack(alignment: .center, spacing: 16.0) {
            profilePicture
            
            VStack(alignment: .leading, spacing: 2){
                Text("Het Prajapati")
                    .font(.title2)
                    .fontWeight(.bold)
                    .lineLimit(1)
                    .foregroundColor(.white)
                
                Text("View Recipes")
                    .font(.footnote)
                    .foregroundColor(Color.white.opacity(0.7))
            }
            
            Spacer()
            
            glowIcon
        }
        .blurBackground()
        
    }
    
    var profilePicture: some View {
        ZStack {
            Image(systemName: "circle.fill")
                .resizable()
                .font(.system(size: 66))
                .angularGradientGlow(colors: [Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)), Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))])
                .frame(width: 66, height: 66)
                .blur(radius: 10)
            
            VStack {
                Image("bg2")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 66, height: 66, alignment: .center)
                    .cornerRadius(50)
            }
            .overlay(
                Circle()
                    .stroke(style: StrokeStyle(lineWidth: 2))
                    .foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)).opacity(0.7))
            )
        }
    }
    
    var glowIcon: some View {
        ZStack {
            AngularGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)), Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)), Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))]), center: .center, startAngle: .init(degrees: -190), endAngle: .degrees(155))
                .blur(radius: 8)
                .shadow(radius: 30)
                .frame(width: 36, height: 36)
            
            Image(systemName: "square.stack.fill")
                .linearGradientBackground(colors: [Color(#colorLiteral(red: 0.6196078431, green: 0.6784313725, blue: 1, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.5607843137, blue: 0.9803921569, alpha: 1))])
                .frame(width: 36.0, height: 36)
                .background(Color(#colorLiteral(red: 0.1019607843, green: 0.07058823529, blue: 0.2431372549, alpha: 1)).opacity(0.8))
                .mask(RoundedRectangle(cornerRadius: 12, style: .continuous))
                .overlay(RoundedRectangle(cornerRadius: 12, style: .continuous).stroke(Color.white.opacity(0.7), lineWidth: 1).blendMode(.overlay))
        }
    }
}

struct ProfileRow_Previews: PreviewProvider {
    static var previews: some View {
        ProfileRow()
    }
}

