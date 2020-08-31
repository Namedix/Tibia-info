//
//  NewsDetailsReducer.swift
//  TibiaInfo
//
//  Created by Namedix on 31/08/2020.
//  Copyright © 2020 Bartłomiej Pichalski. All rights reserved.
//

import ComposableArchitecture

typealias NewsDetailsReducer = Reducer<NewsDetailsState, NewsDetailsAction, NewsDetailsEnvironment>

private struct GetNewsDetailsEffectId: Hashable {}

let newsDetailsReducer = NewsDetailsReducer { state, action, environment in
    switch action {
    case .getDetails:
        state.isLoading = true
        return environment.networkClient
            .getNewsDetails(state.newsId)
            .receive(on: environment.mainQueue)
            .catchToEffect()
            .map(NewsDetailsAction.didGetDetails)
            .cancellable(id: GetNewsDetailsEffectId(), cancelInFlight: true)

    case .didGetDetails(.success(let details)):
        state.isLoading = false
        state.newsDetials = details
        return .none

    case .didGetDetails(.failure(let error)):
        state.isLoading = false
        return .none
    }
}
