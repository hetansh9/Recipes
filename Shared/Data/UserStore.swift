//
//  UserStore.swift
//  Recipes
//
//  Created by Het Prajapati on 6/28/21.
//

import SwiftUI
import Combine

class UserStore: ObservableObject {
    @Published var isLogged = false
    @Published var showLogin = false
}
