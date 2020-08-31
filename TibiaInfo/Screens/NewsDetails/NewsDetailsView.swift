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
        WithViewStore(self.store.scope(
            state: NewsDetailsViewState.init(state:)
        )) { viewStore in
            VStack {
                if viewStore.isLoading {
                    ActivityIndicator(color: UIColor.appBlackPearl)
                        .padding()
                } else {
                    HTMLStringView(htmlContent: viewStore.content)
                        .padding()

                }
            }
            .fullHeight(alignment: .top)
            .fullWidth(alignment: .center)
            .background(Color.appDutchWhite)
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarTitle(viewStore.title)
            .onAppear {
                viewStore.send(.getDetails)
            }
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
