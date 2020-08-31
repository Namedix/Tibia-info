//
//  NewsDetailsViewStrore.swift
//  TibiaInfo
//
//  Created by Namedix on 31/08/2020.
//  Copyright © 2020 Bartłomiej Pichalski. All rights reserved.
//

import Foundation

struct NewsDetailsViewState: Equatable {
    let title: String
    let content: String
    let isLoading: Bool

    init(state: NewsDetailsState) {
        self.title = state.title
        self.content = state.newsDetials?.content ?? "Could not load"
        self.isLoading = state.isLoading
    }
}
