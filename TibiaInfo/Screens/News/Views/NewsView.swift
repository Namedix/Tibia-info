//
//  NewsView.swift
//  TibiaInfo
//
//  Created by Namedix on 28/08/2020.
//  Copyright © 2020 Bartłomiej Pichalski. All rights reserved.
//

import SwiftUI
import ComposableArchitecture

struct NewsView: View {
    let store: Store<NewsState, NewsAction>

    init(store: Store<NewsState, NewsAction>) {
        self.store = store

        UINavigationBar.appearance().titleTextAttributes = [
            .foregroundColor: UIColor.appBrownBramble
        ]
        UINavigationBar.appearance().backgroundColor = .appDutchWhite
    }

    var body: some View {
        NavigationView {
            WithViewStore(self.store) { viewStore in
                ScrollView {
                    VStack {
                        if viewStore.isLoading {
                            ActivityIndicator()
                                .padding()
                        } else {
                            if viewStore.news.isEmpty {
                                NewsEmptyView()
                                    .padding()
                            }
                            ForEach(viewStore.news) { news in
                                NewsItemView(
                                    type: news.type,
                                    description: news.news,
                                    date: news.date.date
                                )
                                    .padding([.leading, .top, .trailing])
                            }
                        }
                    }
                    .fullWidth()
                }
                .navigationBarTitle("News", displayMode: .inline)
                .onAppear {
                    viewStore.send(.getNews)
                }
            }
            .background(Color.appBlackPearl)
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView(
            store: Store(
                initialState: NewsState(),
                reducer: .empty,
                environment: ()
            )
        )
    }
}
