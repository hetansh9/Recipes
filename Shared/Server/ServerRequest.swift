//
//  ServerRequest.swift
//  Recipes (iOS)
//
//  Created by Hetansh on 5/20/21.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //getting the basic url from rapid apis and testing it out for now
        let url  = URL(string: "https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/search?query=burger&diet=vegetarian&excludeIngredients=coconut&intolerances=egg%2C%20gluten&number=10&offset=0&type=main%20course")
        guard url != nil else {
            print("Unable to retrieve the URL")
            return
        }
        
        var request = URLRequest(url: url!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
        
        
        let headers = [
            "x-rapidapi-key": "8f1a562dfe5446dfa12c9df74680245a",
            "x-rapidapi-host": "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com",
            "content-type": "application/json"
            
        ]
        
        request.allHTTPHeaderFields = headers
        
        let jsonObject = [
            "query": "burger",
            "diet" : "vegetarian",
            "excludeingredients": "coconut",
            "intolerances": "egg,gluten",
            "number": 10,
            "offset": 0,
            "type": "main course"] as [String : Any]
        
        do {
                let requestBody = try JSONSerialization.data(withJSONObject: jsonObject, options: .fragmentsAllowed)
            request.httpBody = requestBody
        }
        catch {
            print("Error creating object from json")
        }
        
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        
        let datatask = session.dataTask(with: request) { (data, response, error) in
                
            if error == nil && data != nil {
                
                do {
                    let items = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String:Any]
                    
                }catch {
                    print("Error")
                }
            }
        }
        datatask.resume()
    }
}
