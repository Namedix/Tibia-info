//
//  NewsDetailsReducer.swift
//  TibiaInfo
//
//  Created by Namedix on 31/08/2020.
//  Copyright © 2020 Bartłomiej Pichalski. All rights reserved.
//

import ComposableArchitecture

typealias NewsDetailsReducer = Reducer<NewsDetailsState, NewsDetailsAction, NewsDetailsEnvironment>

let newsDetailsReducer = NewsDetailsReducer { state, action, environment in
    return .none
}
