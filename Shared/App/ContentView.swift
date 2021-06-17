//
//  ContentView.swift
//  Shared
//
//  Created by Het Prajapati on 5/20/21.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - PROPERTIES
    @State var showModal: Bool = false
    @ObservedObject var store = RecipeStore()    
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            NavigationView{
                // Might change to VStack depending on the layout
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(store.recipes.indices, id: \.self) { index in
                        GeometryReader { geometry in
                            NavigationLink(destination: RecipesDetailedView()){
                                CardView(recipe: self.store.recipes[index], index: index)
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 320)
                    }
                }
            }//: NAVIGATION
            .navigationViewStyle(StackNavigationViewStyle())
        }
        
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
    var recipe: Recipe
    var index: Int
    var hapticImpact = UIImpactFeedbackGenerator(style: .heavy)
    
    var body: some View {
        // Container containing the Card
        VStack {
            // CARD ITSELF
            VStack(spacing: 0) {
                Text(recipe.title).font(.largeTitle).bold()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                    .padding()
                // Lower Banner
                HStack {
                    VStack(alignment: .leading, spacing: 4){
                        Text(recipe.subtitle)
                            .font(.body).bold()
                            .offset(x: 5)
                    }
                    .foregroundColor(Color.white)
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .padding(12)
                .background(
                    VisualEffectBlur(blurStyle: .systemMaterialDark)
                )
            }
            .background(
                Image(uiImage: #imageLiteral(resourceName: "background-3"))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            )
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
        }//: VStack
        .padding(20)
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
        .onTapGesture {
            withAnimation(.spring()){
                self.hapticImpact.impactOccurred()
                self.showModal.toggle()
            }
        }
        .fullScreenCover(isPresented: $showModal, content: {
            RecipesDetailedView(recipe: recipe)
        })
    }
}
