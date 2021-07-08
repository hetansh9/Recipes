//
//  RecipeNutrientsView.swift
//  Recipes
//
//  Created by Het Prajapati on 6/16/21.
//

import SwiftUI

struct RecipeNutrientsView: View {
    //MARK: - PROPERTIES
    
    var recipe: Recipe
    let nutrients: [String] = ["Energy", "Sugar", "Fat", "Protein", "Vitamins", "Minerals"]
    
    //MARK: - VIEW
    var body: some View {
        GroupBox() {
          DisclosureGroup("Nutritional value per 100g") {
            ForEach(0..<nutrients.count, id: \.self) { item in
              Divider().padding(.vertical, 2)
              
              HStack {
                Group {
                  Image(systemName: "info.circle")
                  Text(nutrients[item])
                }
                .foregroundColor(recipe.color)
                .font(Font.system(.body).bold())
                
                Spacer(minLength: 25)
                
                Text(recipe.nutrition[item])
                  .multilineTextAlignment(.trailing)
              }
            }
          }
        } //: BOX
    }
}

struct RecipeNutrientsView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeNutrientsView(recipe: recipesData[0])
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 375, height: 480))
            .padding()
    }
}
