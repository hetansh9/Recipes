//
//  ContentView.swift
//  Shared
//
//  Created by Het Prajapati on 5/20/21.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - PROPERTIES
    
    @State private var isShowingSettings: Bool = false
    
    var foods: [Food] = foodsData
    
    var body: some View {
        NavigationView{
            List{
                
            }//: LIST
            .navigationBarTitle("Recipes")
            .navigationBarItems(
                trailing:
                    Button(action: {
                        isShowingSettings = true
                    }){
                        Image(systemName: "slider.horizontal.3")
                    } //: BUTTON
                    .sheet(isPresented: $isShowingSettings) {
                        SettingsView()
                    }
            )
        }//: NAVIGATION
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
