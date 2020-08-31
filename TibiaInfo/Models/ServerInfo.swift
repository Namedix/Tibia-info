//
//  ServerInfo.swift
//  TibiaInfo
//
//  Created by Namedix on 28/08/2020.
//  Copyright © 2020 Bartłomiej Pichalski. All rights reserved.
//

import Foundation

struct Information: Codable {
    let apiVersion: Int
    let executionTime: Double
    let lastUpdated, timestamp: String

    enum CodingKeys: String, CodingKey {
        case apiVersion = "api_version"
        case executionTime = "execution_time"
        case lastUpdated = "last_updated"
        case timestamp
    }
}

extension Information {
    static var mock: Information {
        Information(apiVersion: 1, executionTime: 2.0, lastUpdated: "dasdas", timestamp: "dasdas")
    }
}
