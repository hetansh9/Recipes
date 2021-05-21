//
//  RecipesStaticData.swift
//  Recipes
//
//  Created by Het Prajapati on 5/21/21.
//

import SwiftUI

struct RecipesData: Identifiable {
    var id = UUID()
    var title: String
    var subtitle: String
    var image: String
    var color: Color
}

var recipesData = [
    
    RecipesData(title: "Lasagna", subtitle: "Italian", image: "breakfast", color: Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1))),
    
    RecipesData(title: "Mac n cheese", subtitle: "Classic", image: "cooking", color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))),
                
    RecipesData(title: "Friday Night", subtitle: "10 Servings", image: "hamburger", color: Color(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))),
    
    RecipesData(title: "Weekend Breakfasts", subtitle: "Easy ideas", image: "diet", color: Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))),
                            
                        
]
