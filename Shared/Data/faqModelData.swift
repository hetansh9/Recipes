//
//  faqModelData.swift
//  Recipes
//
//  Created by Het Prajapati on 6/26/21.
//

import Foundation

var faqData: [FAQ] = load("faqData.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Coudn't find \(filename) in the main bundle")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Coudn't load \(filename) from main bundle: \n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Coudn't parse \(filename) as \(T.self):\n\(error)")
    }
}
