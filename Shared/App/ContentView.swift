//
//  ContentView.swift
//  Shared
//
//  Created by Het Prajapati on 5/20/21.
//

import SwiftUI


import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            List{
                
            }//: LIST
            .navigationBarTitle("Recipes")
        //.navigationBarItems()
        }//: NAVIGATION
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
