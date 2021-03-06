//
//  NewsState.swift
//  TibiaInfo
//
//  Created by Namedix on 28/08/2020.
//  Copyright © 2020 Bartłomiej Pichalski. All rights reserved.
//

import Foundation

struct NewsState: Equatable {
    var news: [News] = []
    var isLoading: Bool = false
    var newsDetails: NewsDetailsState?
}
