//
//  SearchView.swift
//  Recipes
//
//  Created by Het Prajapati on 5/21/21.
//

import SwiftUI

// need to add the tittle and change the alingment for the search bar 

struct SearchView: View {
    
    // MARK: - PROPERTIES
    @State var text = ""
    let searchBar = UISearchBar()
    let tableview = UITableView()
    @State var currentTask : URLSessionTask?
    @State var recipeSuggestions = [AutoComplete]()
    var columns = Array(repeating: GridItem(.flexible()), count: 2)
    
    // MARK: - VIEW
    var body: some View {
        
        NavigationView{
                ScrollView(.vertical, showsIndicators: false){
                    VStack{
                        SearchBar(text: $text)
                    LazyVGrid(columns: columns, spacing: 20){
                        ForEach(mData.filter({"\($0)".contains(text) || text.isEmpty})){ i in
                            VStack{
                                Text(i.title)
                                Text(i.subtitle)
                            }
                            .padding(.all, 30)
                            .background(Color.gray)
                        }
                    }
                }
            }
            .navigationBarTitle("Search")
        }
    }
    func search(_ SearchBar : UISearchBar, textDidChange searchText : String){
        currentTask?.cancel()
        currentTask = ServerRequest.autoComplete(query: searchText) { (recipeSuggestions, error) in
            self.recipeSuggestions = recipeSuggestions
            DispatchQueue.main.async {
                self.tableview.reloadData()
            }

        }

    }



//extension SearchView {
//    func search() {
//
//    }
//}

    
    struct SearchView_Previews: PreviewProvider {
        static var previews: some View {
            SearchView()
        }
    }

struct MyData: Identifiable {
    var id = UUID()
    var title: String
    var subtitle: String
}

var mData = [

    MyData(title: "Recipes", subtitle: "Delicious"),
    MyData(title: "Instructions", subtitle: "Short"),
    MyData(title: "Ideas", subtitle: "Best"),
    MyData(title: "Weekend Recipes", subtitle: "Quick"),
    MyData(title: "Het", subtitle: "Prajapati"),
    MyData(title: "Hetansh", subtitle: "Patel"),




]
    
}
