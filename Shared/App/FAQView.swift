//
//  FAQView.swift
//  Recipes
//
//  Created by Het Prajapati on 6/23/21.
//

import SwiftUI

struct FAQView: View {
    //MARK: - PROPERTIES
    
    @State private var contentOffset = CGFloat(0)
    @Environment(\.colorScheme) var colorScheme
    let randomTicketNumber = CGFloat.random(in: 1...1000)
    
    //MARK: - VIEW
    var body: some View {
        
        
        ZStack(alignment: .top) {
            
            TrackableScrollView(offsetChanged: {
                offset in
                contentOffset = offset.y
            }) {
                content
            }
            
            VisualEffectBlur(blurStyle: .systemMaterial)
                .opacity(contentOffset < -16 ? 1 : 0)
                .animation(.easeIn)
                .ignoresSafeArea()
                .frame(height: 0)
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .navigationTitle("FAQ").font(.largeTitle)
        .background(
            Image(colorScheme == .dark ? "bg_dark" : "bg_light")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                .opacity(1)
        )
    }
    
    var content: some View{
        
        
        VStack(alignment: .leading, spacing: 16.0){
            
            ForEach(faqData, id: \.id) { faq in
                FAQRow(faq: faq)
            }
            
            Text("Have any Question?")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.subheadline).opacity(0.7)
            
            PrimaryButton()
                .onTapGesture {
                    EmailHelper.shared.sendEmail(subject: "Help Ticket #\(randomTicketNumber)", body: "", to: "hprajapati@albany.edu")
                }
            
        }
        .padding(.horizontal, 20)
    }
}

struct FAQView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            FAQView()
        }
    }
}
