//
//  RecipeStore.swift
//  Recipes
//
//  Created by Het Prajapati on 6/17/21.
//

import Foundation
import SwiftUI
import Contentful
import Combine

let client = Client(spaceId: "oeflf15ff4ct", accessToken: "JP_PQcoUcUrQqzbBnwHD7G92FHQkArGwHCpNZbDV8wk")

func getArray(id: String, completion: @escaping([Entry]) -> ()) {
    let query = Query.where(contentTypeId: id)
    
    client.fetchArray(of: Entry.self, matching: query) { result in
        switch result {
        case .success(let array):
            DispatchQueue.main.async {
                completion(array.items)
            }
        case .failure(let error):
            print(error)
        }
    }
}


class RecipeStore: ObservableObject {
    @Published var recipes: [Recipe] = recipesData
    
    init() {
       
        let colors = [Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)),Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)),Color(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)),Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)),Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)),Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)),Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)),Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1))]
        
        getArray(id: "recipes") { (items) in
            items.forEach { (item) in
                self.recipes.append(
                    Recipe(
                        title: item.fields["title"] as! String,
                        headline: item.fields["headline"] as! String,
                        subtitle: item.fields["subtitle"] as! String,
                        image: item.fields.linkedAsset(at: "image")?.url ?? URL(string: "")!,
                        color: colors.randomElement()!,
                        nutrition: item.fields["nutrition"] as! [String],
                        recipe: item.fields["recipe"] as! String,
                        description: item.fields["description"] as! String
                    )
                )
                print(item.fields["title"] as! String)
            }
        }
    }
}
