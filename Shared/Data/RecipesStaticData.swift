//
//  RecipesStaticData.swift
//  Recipes
//
//  Created by Het Prajapati on 5/21/21.
//

import SwiftUI

struct Recipe: Identifiable {
    var id = UUID()
    var title: String
    var headline: String
    var subtitle: String
    var image: URL
    var color: Color
    var nutrition: [String]
    var recipe: String
    var description: String
}

var recipesData = [
    
//    nutrition: ["240 kJ (57 kcal)","9.96 g","0.33 g","0.74 g","A, B1, B2, B3, B5, B6, B9, C, E, K","Calcium, Iron, Magnasium, Manganese, Phosphorus, Sodium, Zinc"],

    Recipe(title: "Mac N Cheese", headline: "Best Mac N Cheese", subtitle: "Classic", image: URL(string: "https://dl.dropbox.com/s/7ib0kuyencasmtk/hermes-rivera-7ld9_oZDdQs-unsplash.jpg?dl=0")!, color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)), nutrition: ["240 kJ (57 kcal)","9.96 g","0.33 g","0.74 g","A, B1, B2, B3, B5, B6, B9, C, E, K","Calcium, Iron, Magnasium, Manganese, Phosphorus, Sodium, Zinc"],recipe: "Cooking Pasta \n\n 1. Take 1 cup macaroni pasta or elbow macaroni (100 grams or 3.5 ounces).",description: "Macaroni and cheese—also called mac 'n' cheese in the United States, and macaroni cheese in the United Kingdom and is a dish of cooked macaroni pasta and a cheese sauce, most commonly cheddar."),

]
