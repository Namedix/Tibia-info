//
//  NewsViewState.swift
//  TibiaInfo
//
//  Created by Namedix on 31/08/2020.
//  Copyright © 2020 Bartłomiej Pichalski. All rights reserved.
//

import Foundation

struct NewsViewState: Equatable {
    let news: [News]
    let isLoading: Bool
    let selectedNewsId: Int?

    init(state: NewsState) {
        self.news = state.news
        self.isLoading = state.isLoading
        self.selectedNewsId = state.newsDetails?.newsId
    }
}
