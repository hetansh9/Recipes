//
//  LoadingView.swift
//  Recipes
//
//  Created by Het Prajapati on 6/27/21.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            LottieView(fileName: "lf30_editor_6ffxqo4j").frame(width: 200, height: 200)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
