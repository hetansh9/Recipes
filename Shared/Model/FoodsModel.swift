//
//  FoodsModel.swift
//  Recipes
//
//  Created by Het Prajapati on 5/20/21.
//

import SwiftUI

// MARK: - FOODS DATA MODEL

struct Food: Identifiable {
    var id = UUID()
    var title: String
    var headline: String
    var image: String
    var gradientColors: [Color]
    var description: String
    var nutrition: [String]
}
