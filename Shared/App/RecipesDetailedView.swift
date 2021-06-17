//
//  RecipesDetailedView.swift
//  Recipes
//
//  Created by Het Prajapati on 5/23/21.
//

import SwiftUI

struct RecipesDetailedView: View {
    //MARK: - PROPERTIES
    @SwiftUI.Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var recipe: Recipe = recipesData[0]
    
    var body: some View {
        // Container containing the Card
        ScrollView(.vertical, showsIndicators: false) {
            // CARD ITSELF
            ZStack {
                VStack(spacing: 0) {
                    // Dismiss Button
                    // Have to Add CONSTRAINTS TO FIX POSITION ON SCROLL
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                        print("Dismissed!")
                    }, label: {
                        Circle()
                            .strokeBorder(Color.black.opacity(0.3), lineWidth: 1)
                            .background(
                                Image(systemName: "xmark")
                                    .foregroundColor(Color.black.opacity(1))
                            )
                    })
                    .frame(width: 36, height: 36, alignment: .center)
                    //Fixed Position for now with no constraints
                    .position(x: 388, y: 70)
                    
                    // Title Text and Subtitle banner
                    Text(recipe.title.uppercased()).font(.largeTitle).bold()
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
                .frame(height: 455)
                .background(
                    GeometryReader { g in
                        Image(uiImage: #imageLiteral(resourceName: "background-1"))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .offset(y: g.frame(in: .global).minY > 0 ? -g.frame(in: .global).minY : 0)
                            .frame(height: g.frame(in: .global).minY > 0 ? UIScreen.main.bounds.height / 2.2 + g.frame(in: .global).minY : UIScreen.main.bounds.height / 2.2)
                    }
                    .frame(height: UIScreen.main.bounds.height / 2.2)
                )
                .clipShape(RoundedRectangle(cornerRadius: 0, style: .continuous))
                .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
            }
            
            // Post the Image Part with Description and multiple views
            VStack(alignment: .leading, spacing: 20) {
                
                // HEADLINE
//                Text(recipe.headline)
//                    .font(.headline)
//                    .fontWeight(.heavy)
//                    .multilineTextAlignment(.leading)
//                    .padding(.top)
                
                // NUTRIENTS
                RecipeNutrientsView(recipe: recipe)
                
                // SUBHEADLINE
                Text("Learn more about \(recipe.title)".uppercased())
                    .fontWeight(.bold)
                    .foregroundColor(recipe.color)
                
                
                // DESCRIPTION
                Text(recipe.description)
                    .multilineTextAlignment(.leading)
                    .padding(.trailing)
                
                
            } //: VSTACK
            .padding(20)
            .frame(maxWidth: .infinity, alignment: .leading)
            .navigationBarTitle(recipe.title, displayMode: .inline)
            .navigationBarHidden(true)
            .ignoresSafeArea()
        }
        .edgesIgnoringSafeArea(.top)
    }
    
}

struct RecipesDetailedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesDetailedView()
//                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
    }
}


