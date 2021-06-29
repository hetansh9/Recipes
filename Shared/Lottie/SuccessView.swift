//
//  SuccessView.swift
//  Recipes
//
//  Created by Het Prajapati on 6/27/21.
//

import SwiftUI

struct SuccessView: View {
    @State var show = false
    
    var body: some View {
        VStack {
            Text("Logging you...")
                .font(.title).bold()
                .opacity(show ? 1 : 0)
                .animation(Animation.linear(duration: 1).delay(0.2))
            
            LottieView(fileName: "61237-website-design-lottie-animation")
                .frame(width: 300, height: 150, alignment: .center)
                .opacity(show ? 1 : 0)
                .animation(Animation.linear(duration: 1).delay(0.4))
        }
        .padding(.top, 30)
        .background(VisualEffectBlur(blurStyle: .systemUltraThinMaterial))
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(color: Color.black.opacity(0.2), radius: 30, x: 0, y: 30)
        .scaleEffect(show ? 1 : 0.5)
        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
        .onAppear{
            self.show = true
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(show ? 0.25 : 0))
        .animation(.linear(duration: 1))
        .edgesIgnoringSafeArea(.all)
        
    }
}

struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessView()
    }
}
