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
        UINavigationBar.appearance().tintColor = UIColor.appBrownBramble
    }

    var body: some View {
        NavigationView {
            WithViewStore(self.store.scope(
                state: NewsViewState.init(state:)
            )) { viewStore in
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
                                self.navigationToDetails(
                                    news: news,
                                    selection: viewStore.binding(
                                        get: \.selectedNewsId,
                                        send: NewsAction.selectNews
                                    )
                                )
                            }
                        }
                    }
                    .fullWidth()
                }
                .onAppear {
                    viewStore.send(.getNews)
                }
            }
            .background(Color.appBlackPearl)
            .edgesIgnoringSafeArea(.bottom)
            .navigationViewStyle(StackNavigationViewStyle())
            .navigationBarTitle("News", displayMode: .inline)
        }
    }

    func navigationToDetails(news: News, selection: Binding<Int?>) -> some View {
        NavigationLink(
            destination: IfLetStore(
                self.store.scope(
                    state: \.newsDetails,
                    action: NewsAction.newsDetails
                ),
                then: NewsDetailsView.init(store:)
            ),
            tag: news.id,
            selection: selection
        ) {
            NewsItemView(
                type: news.type,
                description: news.news,
                date: news.date.date
            )
        }.padding([.leading, .top, .trailing])
    }
}

#if DEBUG
struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView(
            store: Store(
                initialState: NewsState(news: [.mock]),
                reducer: .empty,
                environment: ()
            )
        )
    }
}
#endif
