//
//  SearchViewController.swift
//  Recipes
//
//  Created by Hetansh on 5/23/21.
//

import SwiftUI
import UIKit


class SearchViewController: UIViewController {
    
    let searchController = UISearchController()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        title = "Search" 
        navigationItem.searchController = searchController
        
    }
    
}



