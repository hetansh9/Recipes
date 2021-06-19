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
        
        getArray(id: "recipes") { (items) in
            items.forEach { (item) in
                self.recipes.append(
                    Recipe(
                        title: item.fields["title"] as! String,
                        headline: item.fields["headline"] as! String,
                        subtitle: item.fields["subtitle"] as! String,
                        image: item.fields.linkedAsset(at: "image")?.url ?? URL(string: "")!,
                        color: Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)),
                   //   nutrition: item.fields["nutrition"] as! [String],
                        recipe: item.fields["recipe"] as! String,
                        description: item.fields["description"] as! String
                    )
                )
                print(item.fields["title"] as! String)
            }
        }
    }
}
