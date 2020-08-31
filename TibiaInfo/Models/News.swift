//
//  News.swift
//  TibiaInfo
//
//  Created by Namedix on 28/08/2020.
//  Copyright © 2020 Bartłomiej Pichalski. All rights reserved.
//

import Foundation

struct News: Codable, Equatable, Identifiable {
    let id: Int
    let type: String
    let news: String
    let apiurl: String
    let tibiaurl: String
    let date: DateClass
}

struct DateClass: Codable, Equatable {
    let date: String
    let timezoneType: Int
    let timezone: String

    enum CodingKeys: String, CodingKey {
        case date
        case timezoneType = "timezone_type"
        case timezone
    }
}

extension News {
    static var mock: News {
        News(id: 0, type: "News", news: "Bugfixes and Content Changes", apiurl: "url", tibiaurl: "url", date: .mock)
    }
}

extension DateClass {
    static var mock: DateClass {
        DateClass(date: "20.08.2020", timezoneType: 1, timezone: "")
    }
}
