//
//  RecipesDetailedView.swift
//  Recipes
//
//  Created by Het Prajapati on 5/23/21.
//

import SwiftUI

struct RecipesDetailedView: View {
    //MARK: - PROPERTIES
    @Environment(\.presentationMode) var presentationMode
    @GestureState var tap = false
    
    var recipe: RecipesData = recipesData[0]
    
    var body: some View {
        
        // Tap Gesture
        let tapGesture = LongPressGesture().updating($tap) { newValue, state, transaction in
            state = newValue
        }
        
        // Container containing the Card
        ZStack {
            VStack(spacing: 16) {
                // CARD ITSELF
                VStack(spacing: 0) {
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
                .frame(maxWidth: .infinity, maxHeight: 450)
                .background(
                    Image(uiImage: #imageLiteral(resourceName: "background-1"))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                )
                .clipShape(RoundedRectangle(cornerRadius: 0, style: .continuous))
                .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
                
                Spacer()
                
            }//: VStack
            .ignoresSafeArea()
            
            // Dismiss Button
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Circle()
                    .strokeBorder(Color.black.opacity(0.3), lineWidth: 1)
                    .background(
                        Image(systemName: "xmark")
                            .foregroundColor(Color.black.opacity(1))
                    )
//                    .scaleEffect(tap ? 0 : 1)
//                    .gesture(tapGesture)
//                    .animation(.spring())
            })
            .frame(width: 36, height: 36, alignment: .center)
            //Fixed Position for now with no constraints
            .position(x: 388, y: 30)
        }
    }
}

struct RecipesDetailedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesDetailedView()
//        .previewDevice(PreviewDevice(rawValue: "iPhone 8")
    }
}
