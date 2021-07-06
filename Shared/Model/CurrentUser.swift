//
//  CurrentUser.swift
//  Recipes
//
//  Created by Het Prajapati on 7/1/21.
//

import Foundation

struct CurrentUser {
    let uid: String
    let firstName: String
    let lastName: String
    let profileImageURL: String
    
    init(uid: String, dictionary: [String: Any]) {
        self.uid = uid
        self.firstName = dictionary["firstName"] as? String ?? ""
        self.lastName = dictionary["lastName"] as? String ?? ""
        self.profileImageURL = dictionary["photoURL"] as? String ?? ""
    }
}
