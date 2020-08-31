//
//  NewsDetails.swift
//  TibiaInfo
//
//  Created by Namedix on 31/08/2020.
//  Copyright © 2020 Bartłomiej Pichalski. All rights reserved.
//

import Foundation

struct NewsDetailsInfo: Codable {
    let news: NewsDetails
    let information: Information
}

struct NewsDetails: Codable, Equatable {
    let id: Int
    let title: String
    let content: String
    let date: DateClass
}

extension NewsDetails {
    static var mock: NewsDetails {
        NewsDetails(
            id: 0,
            title: "Double XP and Double Skill Weekend",
            content: "If &lt;img src=\"https://static.tibia.com/images/news/doublexp_doubleskill_small.png\"; width=\"280\" height=\"216\" align=\"right\" hspace=\"4\" vspace=\"4\"&gt;you are looking for an opportunity to level up and to improve your skills: here it is! A double XP and double skill weekend is ahead!&lt;br&gt;&lt;br&gt;Between the server saves of &lt;b&gt;May 6&lt;/b&gt; and &lt;b&gt;May 9&lt;/b&gt;, all monsters will yield twice the usual amount of experience points, and your skill training, including magic level, will advance twice as fast. The skill progress when training offline will also be doubled.&lt;br&gt;&lt;br&gt;Get ready for intense hunting sessions! If you want to stock up your resources, you ",
            date: .mock
        )
    }
}
