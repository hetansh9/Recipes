//
//  SignUpView.swift
//  Recipes
//
//  Created by Het Prajapati on 6/30/21.
//

import SwiftUI
import FirebaseAuth

struct SignUpView: View {
    
    //MARK: - PROPERTIES
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var editingEmailTextField: Bool = false
    @State private var editingPasswordTextField: Bool = false
    @State private var emailIconBounce: Bool = false
    @State private var passwordIconBounce: Bool = false
    //    @State private var signupToggle: Bool = true
    @State private var alertTitle = ""
    @State private var showAlertToggle = false
    @State private var fadeToggle: Bool = true
    @State private var showAlert = false
    @State private var alertMessage = "Something Went Wrong!"
    @State private var isLoading = false
    @State private var isSuccessfull = false
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var user: UserStore
    
    private let generator = UISelectionFeedbackGenerator()
    
    // HIDE KEYBOARD ON BUTTON PRESS
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    //MARK: - VIEW
    var body: some View {
        ZStack {
            
            Image("bg1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                .opacity(fadeToggle ? 1.0 : 0.0)
            
            Color("secondaryBackground")
                .edgesIgnoringSafeArea(.all)
                .opacity(fadeToggle ? 0.0 : 1.0)
            
            VStack {
                
                VStack(alignment: .leading, spacing: 16) {
                    
                    // Components above the textfields
                    Text("Sign Up")
                        .font(Font.largeTitle.bold())
                        .foregroundColor(.white)
                    Text("Get access to all the premium content by signing up")
                        .font(.subheadline)
                        .foregroundColor(Color.white.opacity(0.7))
                    
                    // Email Text Field
                    HStack(spacing: 12.0) {
                        
                        TextfieldIcon(iconName: "envelope.open.fill", currentlyEditing: $editingEmailTextField)
                            .scaleEffect(emailIconBounce ? 1.2 : 1.0)
                        
                        TextField("Email", text: $email) { isEditing in
                            
                            editingEmailTextField = isEditing
                            editingPasswordTextField = false
                            
                            
                            if isEditing {
                                generator.selectionChanged()
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
                    .background(Color("textField")
                                    .cornerRadius(16.0)
                                    .opacity(0.15)
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
                        Color("textField")
                            .cornerRadius(16.0)
                            .opacity(0.15)
                    )
                    .onTapGesture {
                        generator.selectionChanged()
                        editingPasswordTextField = true
                        //                        editingEmailTextField = false
                        
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
                    
                    GradientButton(buttonTitle: "Create Account") {
                        generator.selectionChanged()
                        self.hideKeyboard()
                        self.signUp()
                    }
                    //                    .onAppear {
                    //                        Auth.auth().addStateDidChangeListener { auth, user in
                    //                            if user != nil {
                    //                                withAnimation(.easeOut) {
                    //
                    //                                }
                    //                            }
                    //                        }
                    //                    }
                    .alert(isPresented: $showAlert){
                        Alert(title: Text("Error!"), message: Text(self.alertMessage), dismissButton: .default(Text("OK")))
                    }
                    
                    // Only Show Disclaimer if signupToggle = true
                    //                    if signupToggle {
                    Text("By clicking on Sign up, you agree to our Terms of service and Privacy policy")
                        .font(.footnote)
                        .foregroundColor(Color.white.opacity(0.7))
                    
                }
                
                //
                //                Rectangle()
                //                    .frame(height: 1)
                //                    .foregroundColor(Color.white.opacity(0.1))
                
            }
            .padding(20)
            .background(RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.white.opacity(0.2))
                            .background(Color("secondaryBackground").opacity(0.5))
                            .background(VisualEffectBlur(blurStyle: .systemUltraThinMaterialDark))
                            .shadow(color: Color("shadowColor").opacity(0.5), radius: 60, x: 0, y: 30)
            )
            .cornerRadius(30.0)
            .padding(.horizontal)
            .onTapGesture {
                self.hideKeyboard()
            }
            
            if isLoading {
                LoadingView()
            }
            
            if isSuccessfull {
                SuccessView()
                //Signed Up View
            }
            
            //Custom Dismiss Button
            VStack {
                
                HStack {
                    Spacer()
                    
                    Button(action: {
                            presentationMode.wrappedValue.dismiss()

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
        .onTapGesture {
            self.hideKeyboard()
        }
        //        .fullScreenCover(isPresented: $showProfileView) {
        //            ProfileView()
        //        }
    }
    
    func signUp() {
        
        self.isLoading = true
        generator.selectionChanged()
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            self.isLoading = false
            
            if error != nil {
                self.alertMessage = error?.localizedDescription ?? ""
                self.showAlert = true
                print(error!.localizedDescription)
                return
            } else {
                self.isSuccessfull = true
                self.user.isLogged = true
                UserDefaults.standard.set(true, forKey: "isLogged")
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.email = ""
                    self.password = ""
                    self.isSuccessfull = false
                    withAnimation(.easeOut) {
//                        self.user.showSignUp = false
                        self.user.showLogin = false
                    }
                }
                print("User Signed Up!")
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView().environmentObject(UserStore())
    }
}