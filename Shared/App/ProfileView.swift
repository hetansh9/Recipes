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
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var editingEmailTextField: Bool = false
    @State private var editingPasswordTextField: Bool = false
    @State private var emailIconBounce: Bool = false
    @State private var passwordIconBounce: Bool = false
    
    private let generator = UISelectionFeedbackGenerator()
    
    
    //MARK: - VIEW
    var body: some View {
        ZStack {
            
            Image("background-1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                VStack(alignment: .leading, spacing: 16) {
                    
                    Text("Sign Up")
                        .font(Font.largeTitle.bold())
                        .foregroundColor(.white)
                    Text("Access all the amazing recipes by signing up")
                        .font(.subheadline)
                        .foregroundColor(Color.white.opacity(0.7))
                    
                    // Email Text Field
                    HStack(spacing: 12.0) {
                        
                        TextfieldIcon(iconName: "envelope.open.fill", currentlyEditing: $editingEmailTextField)
                            .scaleEffect(emailIconBounce ? 1.2 : 1.0)
                        
                        TextField("Email", text: $email) { isEditing in
                            
                            editingEmailTextField = isEditing
                            editingPasswordTextField = false
                            generator.selectionChanged()
                            
                            if isEditing{
                                withAnimation(.spring(response: 0.3, dampingFraction: 0.4, blendDuration: 0.5)) {
                                    emailIconBounce.toggle()
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                                    withAnimation(.spring(response: 0.3, dampingFraction: 0.4, blendDuration: 0.5)){
                                        emailIconBounce.toggle()
                                    }
                                }
                            }
                        }
                            .colorScheme(.dark)
                            .foregroundColor(Color.white.opacity(0.7))
                            .autocapitalization(.none)
                            .textContentType(.emailAddress)
                    }
                    .frame(height: 52)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.white, lineWidth: 1.0)
                            .blendMode(.overlay)
                        
                    )
                    .background(Color("secondaryBackground")
                                    .cornerRadius(16.0)
                                    .opacity(0.8)
                    )
                    
                    //Password Text Field
                    HStack(spacing: 12.0) {
                        TextfieldIcon(iconName: "key.fill", currentlyEditing: $editingPasswordTextField)
                            .scaleEffect(passwordIconBounce ? 1.2 : 1.0)
                        SecureField("Password", text: $password)
                            .colorScheme(.dark)
                            .foregroundColor(Color.white.opacity(0.7))
                            .autocapitalization(.none)
                            .textContentType(.password)
                    }
                    .frame(height: 52)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.white, lineWidth: 1.0)
                            .blendMode(.overlay)
                        
                    )
                    .background(
                        Color("secondaryBackground")
                                    .cornerRadius(16.0)
                                    .opacity(0.8)
                    )
                    .onTapGesture {
                        editingPasswordTextField = true
                        editingEmailTextField = false
                        
                        generator.selectionChanged()
                        
                        if editingPasswordTextField {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.4, blendDuration: 0.5)) {
                                passwordIconBounce.toggle()
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                                withAnimation(.spring(response: 0.3, dampingFraction: 0.4, blendDuration: 0.5)){
                                    passwordIconBounce.toggle()
                                }
                            }
                        }
                    }
                    
                    /*
                     Past the text fields
                     Sign Up Button
                    */
                    
                    GradientButton()
                    
                    Text("By clicking on Sign up, you agree to our Terms of service and Privacy policy")
                        .font(.footnote)
                        .foregroundColor(Color.white.opacity(0.7))
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(Color.white.opacity(0.1))
                    
                    VStack(alignment: .leading, spacing: 16, content: {
                        Button(action: {
                            print("Switch to Sign in")
                        }, label: {
                            HStack(spacing: 4){
                                Text("Already have an account?")
                                    .font(.footnote)
                                    .foregroundColor(Color.white.opacity(0.7))
                                GradientText(text: "Sign In")
                                    .font(Font.footnote.bold())
                                    
                            }
                        })
                    })
                }
                .padding(20)
            }
            .background(RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.white.opacity(0.2))
                            .background(Color("secondaryBackground").opacity(0.5))
                            .background(VisualEffectBlur(blurStyle: .systemThinMaterialDark))
                            .shadow(color: Color("shadowColor").opacity(0.5), radius: 60, x: 0, y: 30)
            )
            .cornerRadius(30.0)
            .padding(.horizontal)
            
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
