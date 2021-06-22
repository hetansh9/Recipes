//
//  BookmarksView.swift
//  Recipes
//
//  Created by Het Prajapati on 5/21/21.
//

import SwiftUI

struct BookmarksView: View {
    
    @State var variety: [String] = ["Italian" , "Indian", "Mexican" , "Chinese", "American" , "Greek", "Thai"]
    var body: some View {
        NavigationView {
        
            VStack {
                
                HStack {
                    
                    
                    List {
                        // uncomment , if we decide on putting in sections
    //                    Section (
    //                        header: Text("Saved Items"))
    //                    {
                        
                        ForEach(variety, id:\.self) { i in
                            Text(i.capitalized)
                                .padding(10)
                        }
                        
                        .onDelete(perform: delete)
                        .onMove(perform: move)
                            
                        
                   // }
                }
                .listStyle(InsetGroupedListStyle())
                .navigationBarTitle("Bookmarks 🔖 ")
                .navigationBarItems(leading: EditButton())
                    }
            }
       
    }
        .accentColor(.blue)
}
    func delete(indexSet: IndexSet) {
        variety.remove(atOffsets: indexSet)
    }
    
    func move(indices: IndexSet, newOffset: Int) {
        variety.move(fromOffsets: indices, toOffset: newOffset)
    }
    
}

struct BookmarksView_Previews: PreviewProvider {
    static var previews: some View {
        BookmarksView()
    }
}

