//
//  NewsAction.swift
//  TibiaInfo
//
//  Created by Namedix on 28/08/2020.
//  Copyright © 2020 Bartłomiej Pichalski. All rights reserved.
//

import Foundation

enum NewsAction: Equatable {
    case getNews
    case didGetNews(Result<[News],Failure>)
}
