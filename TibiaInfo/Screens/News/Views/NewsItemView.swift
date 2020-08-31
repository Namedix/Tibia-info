//
//  NewsItemView.swift
//  TibiaInfo
//
//  Created by Namedix on 28/08/2020.
//  Copyright © 2020 Bartłomiej Pichalski. All rights reserved.
//

import SwiftUI

struct NewsItemView: View {
    let type: String
    let description: String
    let date: String

    var body: some View {
        VStack {
            HStack {
                Text("Type")
                    .textStyle(.small)
                Text(type)
                    .textStyle(.small)
                Spacer()
            }
            .padding([.leading, .top, .trailing])
            Divider()
            Text(description)
                .textStyle(.medium)
                .padding(.horizontal)
                .padding(.bottom, 4)
            Text(date)
                .textStyle(.small)
                .fullWidth(alignment: .trailing)
                .padding([.trailing, .bottom])
        }
        .background(Color.appDutchWhite)
        .cornerRadius(4)
    }
}

#if DEBUG
struct NewsItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewsItemView(type: "News", description: "Test test", date: "10.08.2020")
            .padding()
            .background(Color.appBlackPearl)
            .previewLayout(.sizeThatFits)
    }
}
#endif
