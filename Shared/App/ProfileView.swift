//
//  ProfileView.swift
//  Recipes
//
//  Created by Het Prajapati on 5/21/21.
//

import UIKit
import SwiftUI
import AudioToolbox

struct ProfileView: View {
    
    //MARK: - PROPERTIES
    
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var user: UserStore
    @State private var contentOffset = CGFloat(0)
    
    //MARK: - VIEW
    var body: some View{
        NavigationView {
            ZStack(alignment: .top) {
                
                if user.showLogin {
                    
                    ZStack{
                        loginView()
                        
                        // Custom Dismiss Button
                        VStack {
                            
                            HStack {
                                Spacer()
                                
                                Button(action: {
                                    self.user.showLogin = false
                                    print("Dismissed!")
                                }, label: {
                                    Circle()
                                        .strokeBorder(Color.white.opacity(0.3), lineWidth: 1)
                                        .background(
                                            Image(systemName: "xmark")
                                                .foregroundColor(Color.white.opacity(1))
                                        )
                                })
                                .frame(width: 36, height: 36, alignment: .center)
                                .padding(.top, 70)
                                .padding(.trailing, 22.5)
                            }
                            Spacer()
                        }
                    }
                    
                    
                } else {
                    TrackableScrollView(offsetChanged: {
                        offset in
                        contentOffset = offset.y
                        //print("contentOffset", contentOffset)
                    }) {
                        content
                        
                    }
                }
                
                VisualEffectBlur(blurStyle: .systemMaterial)
                    .opacity(contentOffset < -16 ? 1 : 0)
                    .animation(.easeIn)
                    .ignoresSafeArea()
                    .frame(height: 0)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(
                Image(colorScheme == .dark ? "bg_dark" : "bg_light")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                    .opacity(1)
                
                
            )
            .navigationBarHidden(true)
        }
        
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    var content: some View {
        
        VStack {
            ProfileRow()
            VStack{
                NavigationLink(destination: FAQView()) {
                    MenuRow()
                }
                
                divider
                
                Link(destination: URL(string: "https://github.com/hetansh9/Recipes")!, label: {
                    MenuRow(title: "Github", leftIcon: "github", rightIcon: "link")
                })
                
            }
            .padding(16)
            .background(VisualEffectBlur(blurStyle: .systemUltraThinMaterialDark))
            .overlay(RoundedRectangle(cornerRadius: 20, style: .continuous).stroke(Color.white, lineWidth: 1).blendMode(.overlay))
            .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .padding(.top, 20)
            
            Text("Version 1.00")
                .foregroundColor(.white.opacity(0.7))
                .padding(.top, 20)
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
                .font(.footnote)
        }
        .foregroundColor(.white)
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .padding(.bottom, 20)
    }
    
    var divider: some View {
        Divider().background(colorScheme == .dark ? Color.white.blendMode(.overlay):  Color.black.blendMode(.overlay))
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
