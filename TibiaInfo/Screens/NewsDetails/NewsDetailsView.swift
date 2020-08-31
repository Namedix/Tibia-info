//
//  NewsDetailsView.swift
//  TibiaInfo
//
//  Created by Namedix on 31/08/2020.
//  Copyright © 2020 Bartłomiej Pichalski. All rights reserved.
//

import SwiftUI
import ComposableArchitecture

struct NewsDetailsView: View {
    let store: Store<NewsDetailsState, NewsDetailsAction>

    var body: some View {
        WithViewStore(self.store) { viewStore in
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .background(Color.appBlackPearl)
                .navigationBarTitle(viewStore.title)
        }
    }
}

#if DEBUG
struct NewsDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsDetailsView(
            store: Store(
                initialState: NewsDetailsState(title: "Test", newsId: 1),
                reducer: .empty,
                environment: ()
            )
        )
    }
}
#endif
