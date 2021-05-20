//
//  ContentView.swift
//  Shared
//
//  Created by Hetansh on 5/20/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            Text("Hello Praja")
                .padding()
                .font(.headline)
            Text("Hello Patel")
                .padding()
                .font(.headline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
