//
//  OnboardingView.swift
//  Recipes
//
//  Created by Hetansh on 5/20/21.
//

import SwiftUI

struct OnboardingView: View {
    // MARK: - PROPERTIES
    
    var foods: [Food] = foodsData
    
    // MARK: - BODY
    
    var body: some View {
        TabView{
            ForEach(foods[0...3]) { item in
                FoodCardView(food: item)
            }//: - LOOP
        } //: TAB
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .padding(.vertical, 20)
    }
}

// MARK: - PREVIEW

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(foods: foodsData)
    }
}
