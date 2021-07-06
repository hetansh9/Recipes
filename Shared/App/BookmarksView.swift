//
//  BookmarksView.swift
//  Recipes
//
//  Created by Het Prajapati on 5/21/21.
//

import SwiftUI

struct BookmarksView: View {
    //MARK: - PROPERTIES
    @State var variety: [String] = ["Italian" , "Indian", "Mexican" , "Chinese", "American" , "Greek", "Thai"]
    
    var foodTypes: [Food] = foodsData
    
    @EnvironmentObject var user: UserStore
    
    //MARK: - VIEW
    var body: some View {
        if user.isLogged {
            NavigationView {
//                ZStack{
                    
//                    Image("bg6")
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .edgesIgnoringSafeArea(.all)
//
                    
                    VStack {
                        
                        HStack {

                            List {
                                ForEach(foodTypes) { item in
                                    BookView(typeData: item)
                                        .padding(.vertical, 4)
                                    
                                        
                                }
                                .onDelete(perform: delete)
                                .onMove(perform: move)
                                
                                
                            }
                            .listStyle(InsetGroupedListStyle())
                            .navigationBarTitle("Bookmarks")
                            .navigationBarItems(leading: EditButton())
                            
                        }
                    }
//                }
            }
            .accentColor(.blue)
        } else {
            NavigationView {
                ZStack {
                    
                    Image("bg6")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)
                    
                        VStack {
                            
                            VStack(alignment: .leading, spacing: 16) {
                                Text("Sign In to use Bookmarks!")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.leading)
                            }
                            .padding(20)
                    }
                    .background(RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color.white.opacity(0.2))
//                                    .background(Color("secondaryBackground").opacity(0.5))
                                    .background(VisualEffectBlur(blurStyle: .systemUltraThinMaterialDark))
                                    .shadow(color: Color("shadowColor").opacity(0.5), radius: 60, x: 0, y: 30)
                    )
                    .cornerRadius(30.0)
                    .padding(.horizontal)
                }
            }
        }
        
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
        BookmarksView(foodTypes: foodsData)
    }
}
