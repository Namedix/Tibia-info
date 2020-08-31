//
//  NetworkClient.swift
//  TibiaInfo
//
//  Created by Namedix on 28/08/2020.
//  Copyright © 2020 Bartłomiej Pichalski. All rights reserved.
//

import Foundation
import ComposableArchitecture

public struct Failure: Error, Equatable {
    public let message: String

    public init(error: Error) {
        self.message = error.localizedDescription
    }

    public init(message: String) {
        self.message = message
    }
}

struct NetworkClient {
    var getNews: () -> Effect<[News],Failure>
    var getNewsDetails: (Int) -> Effect<NewsDetails, Failure>
}

extension NetworkClient {
    static let live = NetworkClient(
        getNews: {
            let url = URL(string: "https://api.tibiadata.com/v2/latestnews.json")!

            return URLSession.shared.dataTaskPublisher(for: url)
                .map { data, _ in data }
                .decode(type: NewsResponse.self, decoder: JSONDecoder())
                .map { $0.newslist.data }
                .mapError { Failure(error: $0) }
                .eraseToEffect()
    },
        getNewsDetails: { newsId in
            let url = URL(string: "https://api.tibiadata.com/v2/news/\(newsId).json")!

            return URLSession.shared.dataTaskPublisher(for: url)
                .map { data, _ in data }
                .decode(type: NewsDetailsInfo.self, decoder: JSONDecoder())
                .map { $0.news }
                .mapError { Failure(error: $0) }
                .eraseToEffect()
    })
}

extension NetworkClient {
    static let mock = NetworkClient(
        getNews: {
            .future { callback in
                callback(.success([News.mock, News.mock, News.mock]))
            }
    }, getNewsDetails: { newsId in
        .future { callback in
            callback(.success(NewsDetails.mock))
        }
    })
}
