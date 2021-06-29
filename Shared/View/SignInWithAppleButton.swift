//
//  SignInWithAppleButton.swift
//  Recipes
//
//  Created by Het Prajapati on 6/30/21.
//

import SwiftUI
import AuthenticationServices
import FirebaseAuth

struct SignInWithAppleButton: UIViewRepresentable {
    typealias UIViewType = ASAuthorizationAppleIDButton
    func makeUIView(context: Context) -> UIViewType {
        return ASAuthorizationAppleIDButton(type: .signIn, style: .black)
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}
