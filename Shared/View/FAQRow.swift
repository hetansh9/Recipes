//
//  FAQRow.swift
//  Recipes
//
//  Created by Het Prajapati on 6/26/21.
//

import SwiftUI

struct FAQRow: View {
    var faq: FAQ
    var body: some View {
        VStack(alignment: .leading, spacing: 16.0) {
            Text(faq.question)
                .font(.title3)
                .fontWeight(.bold)
                .fixedSize(horizontal: false, vertical: true)
            
            Text(faq.answer)
                .font(.subheadline)
                .opacity(0.7)
                .fixedSize(horizontal: false, vertical: true)
            
            
            Divider()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct FAQRow_Previews: PreviewProvider {
    static var previews: some View {
        FAQRow(faq: faqData[0])
    }
}
