//
//  RecipesDetailedView.swift
//  Recipes
//
//  Created by Het Prajapati on 5/23/21.
//

import SwiftUI

struct RecipesDetailedView: View {
    //MARK: - PROPERTIES
    var recipe: RecipesData = recipesData[0]
    
    var body: some View {
        // Container containing the Card
        
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
    }
}

struct RecipesDetailedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesDetailedView()
    }
}
