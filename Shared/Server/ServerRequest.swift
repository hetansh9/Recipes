//
//  ServerRequest.swift
//  Recipes (iOS)
//
//  Created by Hetansh on 5/20/21.
//

import UIKit

class ServerRequest {
    
    static let apiKey = "8f1a562dfe5446dfa12c9df74680245a"
    static let host = "api.spoonacular.com"
    static let scheme = "https"
    
    // configure the recipes such as the tittle and image and everything else
    
    private class func configureRecipe(info: [String: Any]) -> RecipeInfo{
        var recipe = RecipeInfo()
        
        if let title = info["title"] as? String {
            recipe.title = title
        }
        
        if let servings = info["servings"] as? Int {
            recipe.servings = servings
        }
        
        if let imageURL = info["image"] as? String {
            recipe.imageURL = imageURL
        }
        if let sourceURL = info["sourceURL"] as? String {
            recipe.sourceURL = sourceURL
        }
        
        if let ingredientsArray = info["extendedIngredients"] as? [[String: Any]] {
            if ingredientsArray.count == 0 {
                recipe.ingredients = []
            }else {
                var ingredients = [String]()
                for i in ingredientsArray{
                    if let i = i["originalString"] as? String {
                        ingredients.append(i)
                    }
                }
                recipe.ingredients = ingredients
            }
        }else {
            recipe.ingredients = []
            
        }
        
        if let time = info["readyInMinutes"] as? Int {
            recipe.timeRequired = time
        }
        
        if let instructions = info["analyzedInstructions"] as? [[String:Any]] {
            if instructions.count == 0 {
                recipe.instructions = []
            }else {
                var instructionsArray = [String]()
                for j in instructions {
                    if let j = j["Steps"] as? [[String:Any]] {
                        for k in j {
                            if let j = k["step"] as? String {
                                instructionsArray.append(j)
                            }
                        }
                    }
                }
                recipe.instructions = instructionsArray
            }
            
        }else {
            recipe.instructions = []
        }
        return recipe
        
    }
    
    
    class func getSearchRecipe(id: Int, completion: @escaping ( RecipeInfo?, Bool, Error? ) -> Void) {
        var url : URL{
            var components = URLComponents()
            components.host = host
            components.path = "/recipes/\(id)/information"
            components.scheme = scheme
            components.queryItems = [URLQueryItem]()
            components.queryItems?.append(URLQueryItem(name: "apiKey", value: ServerRequest.apiKey))
            
            return components.url!

        }
        
        let task = URLSession.shared.dataTask(with: url) { (data,response, error) in
            if error != nil {
                completion(nil,false,error)
                return
            }
            guard let data = data else {
                 completion(nil,false,error)
                return
            }
            do{ //.fragmentsallowed because for json conversatin as the data is not in an array
                if let responseData = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String: Any] {
                    let app = configureRecipe(info: responseData)
                    completion(app, true, nil)
                }
            }catch {
                completion(nil,false,error)
            }
        }
        task.resume()
    }
    
    class func autoComplete(query: String, completion: @escaping ([AutoComplete], Error?) -> Void ) -> URLSessionTask{
        var result: URL{
            var components = URLComponents()
            components.host = host
            components.path = "/recipes/autocomplete"
            components.scheme = scheme
            
            components.queryItems = [URLQueryItem]()
            components.queryItems?.append(URLQueryItem(name: "apiKey", value: ServerRequest.apiKey))
            components.queryItems?.append(URLQueryItem(name: "number", value: "8"))
            components.queryItems?.append(URLQueryItem(name: "return", value: query))
            
            return components.url!
            
        }
        let task = URLSession.shared.dataTask(with: result) { (data,response, error) in
            guard let data =  data else {
                completion([], error)
                return
            }
            do {
                let responseObject = try JSONDecoder().decode([AutoComplete].self, from: data)
                completion(responseObject, nil)
            }catch {
                completion([],error)
            }
        }
        return task
    }
     
}
