//
//  ProfileRow.swift
//  Recipes
//
//  Created by Het Prajapati on 6/26/21.
//

import SwiftUI

struct ProfileRow: View {
    //MARK - PROPERTIES
    @EnvironmentObject var user: UserStore
    
    //MARK - VIEW
    var body: some View {
        
        if user.isLogged {
            
            HStack(alignment: .center, spacing: 16.0) {
                profilePicture
                
                VStack(alignment: .leading, spacing: 2){
                    Text("Het Prajapati")
                        .font(.title2)
                        .fontWeight(.bold)
                        .lineLimit(1)
                        .foregroundColor(.white)
                    
                    Text("View Profile")
                        .font(.footnote)
                        .foregroundColor(Color.white.opacity(0.7))
                }
                
                Spacer()
                
                glowIcon
            }
            .blurBackground()
            
            
        } else {
            
            HStack(alignment: .center, spacing: 16.0) {
//                profilePicture
                
//                Spacer()
                
                VStack(alignment: .leading, spacing: 2){
                    
                    Button(action: {
                        withAnimation(.easeIn){
                            self.user.showLogin = true
                        }
                    }) {
                        Text("Sign In")
                            .font(.title)
                            .fontWeight(.bold)
                            .lineLimit(1)
                            .foregroundColor(.white)
                            .padding(.horizontal, 40)
                    }
                   
//                    Text("")
//                        .font(.footnote)
//                        .foregroundColor(Color.white.opacity(0.7))
                }
                
//                Spacer()
                
//                glowIcon
            }
            .blurBackground()
            
        }
        
        
    }
    
    var profilePicture: some View {
        ZStack {
            Image(systemName: "circle.fill")
                .resizable()
                .font(.system(size: 66))
                .angularGradientGlow(colors: [Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)), Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))])
                .frame(width: 56, height: 56)
                .blur(radius: 10)
            
            VStack {
                if user.isLogged {
                    Image("bg1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 56, height: 56, alignment: .center)
                        .cornerRadius(50)
                } else {
                    Button(action: {
                        withAnimation(.easeIn) {
                            self.user.showLogin.toggle()
                        }
                    }) {
                        Image(systemName: "person.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 56, height: 56, alignment: .center)
                            .cornerRadius(50)
                    }
                }
            }
            .overlay(
                Circle()
                    .stroke(style: StrokeStyle(lineWidth: 1))
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)).opacity(0.7))
            )
        }
    }
    
    var glowIcon: some View {
        ZStack {
            AngularGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)), Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)), Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))]), center: .center, startAngle: .init(degrees: -190), endAngle: .degrees(155))
                .blur(radius: 8)
                .shadow(radius: 30)
                .frame(width: 36, height: 36)
            
            Button(action: {
                //settingsView
            }) {
                Image(systemName: "gearshape.fill")
                    .linearGradientBackground(colors: [Color(#colorLiteral(red: 0.6196078431, green: 0.6784313725, blue: 1, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.5607843137, blue: 0.9803921569, alpha: 1))])
                    .frame(width: 36.0, height: 36)
                    .background(Color(#colorLiteral(red: 0.1019607843, green: 0.07058823529, blue: 0.2431372549, alpha: 1)).opacity(0.8))
                    .mask(RoundedRectangle(cornerRadius: 12, style: .continuous))
                    .overlay(RoundedRectangle(cornerRadius: 12, style: .continuous).stroke(Color.white.opacity(0.7), lineWidth: 1).blendMode(.overlay))
            }
            
        }
    }
}

struct ProfileRow_Previews: PreviewProvider {
    static var previews: some View {
        ProfileRow().environmentObject(UserStore())
    }
}

