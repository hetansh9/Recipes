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
        let recipe = RecipeInfo()
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
    
    
    
    
    
    
    
}
