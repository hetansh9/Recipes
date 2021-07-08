//
//  OnboardingView.swift
//  Recipes
//
//  Created by Hetansh on 5/20/21.
//

import SwiftUI

struct OnboardingView: View {
    // MARK: - PROPERTIES
    
    @State private var selection = 0
    
    // MARK: - BODY
    
    var body: some View {
        ZStack {
            background
            TabView(selection: $selection){
                OnboardingCardView(selection: $selection).tag(0)
                OnboardingCardView1(selection: $selection).tag(1)
                OnboardingCardView2().tag(2)
            } //: TAB
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .interactive))
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .padding(.vertical, 20)
            .background(
                ZStack {
                    FaceGraphic(selection: $selection)
                    Blob1Graphic(selection: $selection)
                    Blob2Graphic(selection: $selection)
                }
            )
        }
    }
    
    var background: some View {
        LinearGradient(
            gradient: Gradient(stops: [
                                .init(color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)), location: 0),
                                .init(color: Color(#colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)), location: 1)]),
            startPoint: UnitPoint(x: 0.5000000291053439, y: 1.0838161507153998e-8),
            endPoint: UnitPoint(x: -0.002089660354856915, y: 0.976613295904758))
            .ignoresSafeArea()
            .overlay(
                ZStack {
                    Wave()
                    Wave1()
                }
            )
    }
}

// MARK: - PREVIEW

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
