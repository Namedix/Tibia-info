//
//  NewsReducerTests.swift
//  TibiaInfoTests
//
//  Created by Namedix on 31/08/2020.
//  Copyright © 2020 Bartłomiej Pichalski. All rights reserved.
//

import XCTest
import Foundation
import ComposableArchitecture

@testable import TibiaInfo

final class NewsReducerTests: XCTestCase {
    typealias TestStore = ComposableArchitecture.TestStore<
        NewsState,
        NewsState,
        NewsAction,
        NewsAction,
        NewsEnvironment
    >

    var sut: TestStore!
    var scheduler: TestSchedulerOf<DispatchQueue>!
    var returnedNews: [News]!

    override func setUp() {
        scheduler = DispatchQueue.testScheduler
        returnedNews = [.mock, .mock, .mock]
        sut = TestStore(
            initialState: NewsState(),
            reducer: newsReducer,
            environment: NewsEnvironment(
                mainQueue: scheduler.eraseToAnyScheduler(),
                networkClient: .mock
            )
        )
    }

    override func tearDown() {
        sut = nil
        scheduler = nil
        returnedNews = nil
    }

    func testGetNewsThenSelect() {
        sut.assert(
            .send(.getNews) {
                $0.isLoading = true
            },
            .do { self.scheduler.advance() },
            .receive(.didGetNews(.success(returnedNews))) {
                $0.isLoading = false
                $0.news = self.returnedNews
            },
            .send(.selectNews(News.mock.id)) {
                $0.newsDetails = .init(title: News.mock.news, newsId: News.mock.id)
            }
        )
    }
}
