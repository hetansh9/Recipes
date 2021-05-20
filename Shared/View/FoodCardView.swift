//
//  FoodCardView.swift
//  Recipes
//
//  Created by Hetansh on 5/20/21.
//

import SwiftUI

struct FoodCardView: View {
  
    
    var food: Food
    
    @State private var isAnimating: Bool = false

    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                // Food Image
                Image(food.image)
                    .resizable()
                    .scaledToFit()
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
                    .scaleEffect(isAnimating ? 1.0 : 0.6)
                
                // Food tittle
                Text(food.title)
                    .foregroundColor(Color.white)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .shadow(color: Color(red: 0, green: 0, blue: 9, opacity: 0.15), radius: 2, x: 2, y: 2)
                
                // Food headline
                Text(food.headline)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 16)
                    .frame(maxWidth: 480)
               // Start button view for later purposes
                StartButtonView()
            }//: VSTACK
        }//: ZSTACK
        .onAppear{
            withAnimation(.easeOut(duration: 0.5)){
                isAnimating = true
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .background(LinearGradient(gradient: Gradient(colors: food.gradientColors), startPoint: .top, endPoint: .bottom))
            .cornerRadius(20)
            .padding(.horizontal, 16)
        
    }
}

struct FoodCardView_Previews: PreviewProvider {
    static var previews: some View {
        FoodCardView(food: foodsData[0])
            .previewLayout(.fixed(width: 320, height: 640))
    }
}
