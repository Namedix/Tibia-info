//
//  NewsEnvironment.swift
//  TibiaInfo
//
//  Created by Namedix on 28/08/2020.
//  Copyright © 2020 Bartłomiej Pichalski. All rights reserved.
//

import Foundation
import ComposableArchitecture

struct NewsEnvironment {
    var mainQueue: AnySchedulerOf<DispatchQueue>
    var networkClient: NetworkClient
}
