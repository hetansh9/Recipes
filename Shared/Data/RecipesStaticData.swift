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
//    var nutrition: [String]
    var description: String
}

var recipesData = [
    
//    nutrition: ["240 kJ (57 kcal)","9.96 g","0.33 g","0.74 g","A, B1, B2, B3, B5, B6, B9, C, E, K","Calcium, Iron, Magnasium, Manganese, Phosphorus, Sodium, Zinc"],
//
    Recipe(title: "Lasagna", headline: "Best of the Best", subtitle: "Italian", image: URL(string: "https://dl.dropbox.com/s/pmggyp7j64nvvg8/Certificate%402x.png?dl=0")!,color: Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)),description: "Lasagne, or the singular lasagna, is an Italian dish made of stacked layers of thin flat pasta alternating with fillings such as ragù (ground meats and tomato sauce) and other vegetables, cheese (which may include ricotta and parmesan), and seasonings and spices such as garlic, oregano and basil."),
    
    Recipe(title: "Mac n cheese", headline: "Best Mac n Cheese", subtitle: "Classic", image: URL(string: "https://dl.dropbox.com/s/pmggyp7j64nvvg8/Certificate%402x.png?dl=0")!, color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)), description: "Macaroni and cheese—also called mac 'n' cheese in the United States, and macaroni cheese in the United Kingdom and is a dish of cooked macaroni pasta and a cheese sauce, most commonly cheddar."),
                
    Recipe(title: "Friday Night", headline: "Blueberries are sweet, nutritious and wildly popular fruit all over the world.", subtitle: "10 Servings", image: URL(string: "https://dl.dropbox.com/s/pmggyp7j64nvvg8/Certificate%402x.png?dl=0")!,color: Color(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)), description: "Blueberries are sweet, nutritious and wildly popular fruit all over the world."),
    
    Recipe(title: "Weekend Breakfasts", headline: "Blueberries are sweet, nutritious and wildly popular fruit all over the world.", subtitle: "Easy ideas", image: URL(string: "https://dl.dropbox.com/s/pmggyp7j64nvvg8/Certificate%402x.png?dl=0")!, color: Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)), description: "Blueberries are sweet, nutritious and wildly popular fruit all over the world."),
                            
                        
]
