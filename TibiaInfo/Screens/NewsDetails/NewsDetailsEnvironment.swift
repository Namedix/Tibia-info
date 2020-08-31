//
//  NewsDetailsEnvironment.swift
//  TibiaInfo
//
//  Created by Namedix on 31/08/2020.
//  Copyright © 2020 Bartłomiej Pichalski. All rights reserved.
//

import Foundation
import ComposableArchitecture

struct NewsDetailsEnvironment {
    var mainQueue: AnySchedulerOf<DispatchQueue>
    var networkClient: NetworkClient
}
