//
//  ContentView.swift
//  Shared
//
//  Created by Het Prajapati on 5/20/21.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - PROPERTIES
    
    var foods: [Food] = foodsData
    
    // MARK: - BODY
    var body: some View {
        NavigationView{
            // Might change to VStack depending on the layout
            ScrollView(.vertical, showsIndicators: false) {

                ForEach(recipesData) { item in
                    CardView(recipe: item)
//                        .frame(width: 425, height: 310)
                }
            
            }
        }//: NAVIGATION
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

//MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View {
    
    // MARK: - PROPERTIES
    
    @State private var isShowingSettings: Bool = false
    @State private var showModal: Bool = false
    
    var recipe: RecipesData = recipesData[0]
    var hapticImpact = UIImpactFeedbackGenerator(style: .heavy)
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            Spacer()
            HStack {
                Spacer()
                Image(recipe.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()
            }
            Text(recipe.title)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
            Text(recipe.subtitle)
                .font(.footnote)
                .foregroundColor(Color.white)
        }//: VStack
        .padding(.all)
        .navigationBarTitle("Featured")
        .navigationBarItems(
            trailing:
                Button(action: {
                    isShowingSettings = true
                }){
                    Image(systemName: "slider.horizontal.3")
                } //: BUTTON
                .sheet(isPresented: $isShowingSettings) {
                    SettingsView()
                }
        )
        .background(recipe.color)
        .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
        .shadow(color: recipe.color.opacity(0.3), radius: 20, x: 0, y: 10)
        .padding(15)
        .onTapGesture {
            self.hapticImpact.impactOccurred()
            self.showModal = true
        }
        .sheet(isPresented: self.$showModal) {
            RecipesDetailedView()
        }
    }
}
