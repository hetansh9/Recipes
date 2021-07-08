//
//  RecipesDetailedView.swift
//  Recipes
//
//  Created by Het Prajapati on 5/23/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct RecipesDetailedView: View {
    //MARK: - PROPERTIES
    @SwiftUI.Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.colorScheme) var colorScheme
    var recipe: Recipe = recipesData[0]
    
    var body: some View {
        // Container containing the Card
        ScrollView(.vertical, showsIndicators: false) {
            // CARD ITSELF
            //            ZStack {
            VStack(spacing: 0) {
                Spacer()
                
                VStack {
                    
                    HStack {
                        Spacer()
                        
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
                        .padding(.top, 52)
                        .padding(.trailing, 22.5)
                        //.background(Color.red)
                    }
                    Spacer()
                }
                
                /* Dismiss Button
                 Have to Add CONSTRAINTS TO FIX POSITION ON SCROLL
                 */
                //
                //                        Button(action: {
                //                            self.presentationMode.wrappedValue.dismiss()
                //                            print("Dismissed!")
                //                        }, label: {
                //                            Circle()
                //                                .strokeBorder(Color.black.opacity(0.3), lineWidth: 1)
                //                                .background(
                //                                    Image(systemName: "xmark")
                //                                        .foregroundColor(Color.black.opacity(1))
                //                                )
                //                        })
                //                        .frame(width: 36, height: 36, alignment: .center)
                //                        .background(Color.blue)
                //                        //Fixed Position for now with no constraints
                //                        .position(x: 388, y: 70)
                //
                
                // Lower Banner
                HStack {
                    VStack(alignment: .leading, spacing: 4){
                        Text(recipe.title.uppercased())
                            .font(.title).bold()
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
                    WebImage(url: recipe.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .offset(y: g.frame(in: .global).minY > 0 ? -g.frame(in: .global).minY : 0)
                        .frame(height: g.frame(in: .global).minY > 0 ? UIScreen.main.bounds.height / 2.2 + g.frame(in: .global).minY : UIScreen.main.bounds.height / 2.2)
                }
                .frame(height: UIScreen.main.bounds.height / 2.2)
            )
            .clipShape(RoundedRectangle(cornerRadius: 0, style: .continuous))
            .shadow(color: colorScheme == .dark ? recipe.color.opacity(0.3) : Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
            
            
            
            
            // Post the Image Part with Description and multiple views
            VStack(alignment: .leading, spacing: 20) {
                
                // HEADLINE
                //                Text(recipe.headline)
                //                    .font(.headline)
                //                    .fontWeight(.heavy)
                //                    .multilineTextAlignment(.leading)
                //                    .padding(.top)
                //
                //                Text("Nutrients").uppercased()
                //                    .font(.title)
                //                    .fontWeight(.bold)
                //                    .foregroundColor(recipe.color)
                
                
                
                // SUBHEADLINE
                Text("Recipe".uppercased())
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(recipe.color)
                
                // DESCRIPTION
                Text(recipe.recipe)
                    .multilineTextAlignment(.leading)
                    .padding(.trailing)
                
                // NUTRIENTS
                RecipeNutrientsView(recipe: recipe)
                
                
                // SUBHEADLINE
                Text("Learn more about \(recipe.title)".uppercased())
                    .font(.title3)
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
            //            }
            
            // Custom Dismiss Button
            //                VStack {
            //
            //                    HStack {
            //                        Spacer()
            //
            //                        Button(action: {
            //                            self.presentationMode.wrappedValue.dismiss()
            //                            print("Dismissed!")
            //                        }, label: {
            //                            Circle()
            //                                .strokeBorder(Color.black.opacity(0.3), lineWidth: 1)
            //                                .background(
            //                                    Image(systemName: "xmark")
            //                                        .foregroundColor(Color.black.opacity(1))
            //                                )
            //                        })
            //                        .frame(width: 36, height: 36, alignment: .center)
            //                        .padding(.top, 52)
            //                        .padding(.trailing, 22.5)
            //                        //.background(Color.red)
            //                    }
            //                    Spacer()
            //                }
            
        }
        .edgesIgnoringSafeArea(.top)
    }
    
}

struct RecipesDetailedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesDetailedView()
            .previewDevice("iPhone 12")
        //                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
    }
}


