//
//  StartButtonView.swift
//  Recipes
//
//  Created by Het Prajapati on 5/20/21.
//

import SwiftUI

struct StartButtonView: View {
    // MARK: - PROPERTIES
    
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    @State var buttonTitle: String = ""
    
    // MARK: - BODY
    
    var body: some View {
        Button(action: {
            withAnimation(.easeInOut(duration: 0.3)){
                isOnboarding = false
            }
        }) {
            HStack(spacing: 8) {
                LinearGradient(
                    gradient: Gradient(stops: [
                                        .init(color: Color(#colorLiteral(red: 0.03333336114883423, green: 0.5024509429931641, blue: 1, alpha: 1)), location: 0),
                                        .init(color: Color(#colorLiteral(red: 0.7291666269302368, green: 0.7562500238418579, blue: 1, alpha: 1)), location: 0.5629924535751343),
                                        .init(color: Color(#colorLiteral(red: 1, green: 0.6083333492279053, blue: 0.8732843995094299, alpha: 1)), location: 1)]),
                    startPoint: UnitPoint(x: 1.0125392039427847, y: 1.0175438863216821),
                    endPoint: UnitPoint(x: -1.1102230246251565e-16, y: 0))
                    .frame(maxWidth: 80, maxHeight: 30)
                    .mask(
                        HStack{
                            Text(buttonTitle)
                            Image(systemName: "arrow.right.circle")
                                .imageScale(.large)
                        }
                    )
//                    .mask(Image(systemName: "arrow.right.circle")
//                            .imageScale(.large))
                    
            } //: - HSTACK
            .padding(.horizontal, 16)
            .padding(.vertical, 7)
            .background(
                Capsule().strokeBorder(LinearGradient(
                                        gradient: Gradient(stops: [
                                                            .init(color: Color(#colorLiteral(red: 0.03333336114883423, green: 0.5024509429931641, blue: 1, alpha: 1)), location: 0),
                                                            .init(color: Color(#colorLiteral(red: 0.7291666269302368, green: 0.7562500238418579, blue: 1, alpha: 1)), location: 0.5629924535751343),
                                                            .init(color: Color(#colorLiteral(red: 1, green: 0.6083333492279053, blue: 0.8732843995094299, alpha: 1)), location: 1)]),
                                        startPoint: UnitPoint(x: 1.0125392039427847, y: 1.0175438863216821),
                                        endPoint: UnitPoint(x: -1.1102230246251565e-16, y: 0)), lineWidth: 1.5)
            )
        } //: - BUTTON
        //        .accentColor(Color.white)
    }
}

// MARK: - PREVIEW

struct StartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        StartButtonView(buttonTitle: "Start")
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
