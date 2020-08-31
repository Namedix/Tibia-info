//
//  NewsReducer.swift
//  TibiaInfo
//
//  Created by Namedix on 28/08/2020.
//  Copyright © 2020 Bartłomiej Pichalski. All rights reserved.
//

import ComposableArchitecture

typealias NewsReducer = Reducer<NewsState, NewsAction, NewsEnvironment>

private struct GetNewsEffectId: Hashable {}

let newsReducer = NewsReducer { state, action, environment in
    switch action {
    case .getNews:
        state.isLoading = true
        return environment.networkClient
            .getNews()
            .receive(on: environment.mainQueue)
            .catchToEffect()
            .map(NewsAction.didGetNews)
            .cancellable(id: GetNewsEffectId(), cancelInFlight: true)

    case .didGetNews(.success(let news)):
        state.isLoading = false
        state.news = news
        return .none

    case .didGetNews(.failure(let error)):
        state.isLoading = false
        return .none

    case .selectNews(.some(let newsId)):
        state.newsDetails = state.news
            .first { $0.id == newsId }
            .map { NewsDetailsState(title: $0.news, newsId: $0.id) }
        return .none

    case .selectNews(.none):
        state.newsDetails = nil
        return .none

    case .newsDetails:
        return .none
    }
}
