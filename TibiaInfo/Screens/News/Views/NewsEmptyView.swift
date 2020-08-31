//
//  NewsEmptyView.swift
//  TibiaInfo
//
//  Created by Namedix on 28/08/2020.
//  Copyright © 2020 Bartłomiej Pichalski. All rights reserved.
//

import SwiftUI

struct NewsEmptyView: View {
    var body: some View {
        Text("Sorry, some error occurs :(")
            .foregroundColor(.white)
            .textStyle(.medium)
    }
}

struct NewsEmptyView_Previews: PreviewProvider {
    static var previews: some View {
        NewsEmptyView()
            .background(Color.appBlackPearl)
            .previewLayout(.sizeThatFits)
    }
}
