//
//  SettingsView.swift
//  Recipes
//
//  Created by Het Prajapati on 5/21/21.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - PROPERTIES
    
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isOnboarding") var isOnboarding: Bool = false

    // MARK: - BODY
    
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    // MARK: - SECTION 1
                    
                    GroupBox(
                        label:
                          SettingsLabelView(labelText: "Recipes", labelImage: "info.circle")
                    ) {
                        Divider().padding(.vertical, 4)
                        HStack(alignment: .center, spacing: 10) {
                            Image("breakfast")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .cornerRadius(9)
                            Text("The information on the origin of these recipes can be found by the icon at the top right ")
                                .font(.footnote)
                        }
                    }
                    
                    // MARK: - SECTION 2
                    
                    
                    GroupBox(
                      label: SettingsLabelView(labelText: "Customization", labelImage: "paintbrush")
                    ) {
                      Divider().padding(.vertical, 4)
                      
                      Text("If you wish, you can restart the application by toggle the switch in this box. That way it starts the onboarding process and you will see the welcome screen again")
                        .padding(.vertical, 8)
                        .frame(minHeight: 60)
                        .layoutPriority(1)
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                      
                      Toggle(isOn: $isOnboarding) {
                        if isOnboarding {
                          Text("Restarted".uppercased())
                            .fontWeight(.bold)
                            .foregroundColor(Color.green)
                        } else {
                          Text("Restart".uppercased())
                            .fontWeight(.bold)
                            .foregroundColor(Color.secondary)
                        }
                      }
                      .padding()
                      .background(
                        Color(UIColor.tertiarySystemBackground)
                          .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                      )
                    }
                    
                    // MARK: - SECTION 3
                    
                    GroupBox(
                      label:
                      SettingsLabelView(labelText: "Application", labelImage: "apps.iphone")
                    ) {
                      SettingsRowView(name: "Developers", content: "Het & Hetansh")
                      SettingsRowView(name: "Designer", content: "H & H")
                      SettingsRowView(name: "Compatibility", content: "iOS 14")
                      SettingsRowView(name: "Website", linkLabel: "Apple", linkDestination: "apple.com")
                      SettingsRowView(name: "Twitter", linkLabel: "@PrajapatiHet", linkDestination: "twitter.com/PrajapatiHet")
                      SettingsRowView(name: "SwiftUI", content: "2.0")
                      SettingsRowView(name: "Version", content: "1.0")
                    }
                    
                    
                    
                }//: VSTACK
                .navigationBarTitle(Text("Settings"), displayMode: .large)
                .navigationBarItems(
                    trailing:
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "xmark")
                        }
                )
                .padding()
            } //: SCROLL
        } //: NAVIGATION
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
