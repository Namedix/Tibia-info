//
//  NewsDetailsAction.swift
//  TibiaInfo
//
//  Created by Namedix on 31/08/2020.
//  Copyright © 2020 Bartłomiej Pichalski. All rights reserved.
//

import Foundation

enum NewsDetailsAction: Equatable {
    case getDetails
    case didGetDetails(Result<NewsDetails, Failure>)
}
