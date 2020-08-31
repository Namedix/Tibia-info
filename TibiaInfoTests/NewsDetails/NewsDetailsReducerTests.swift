//
//  NewsDetailsReducerTests.swift
//  TibiaInfoTests
//
//  Created by Namedix on 31/08/2020.
//  Copyright © 2020 Bartłomiej Pichalski. All rights reserved.
//

import ComposableArchitecture
import XCTest

@testable import TibiaInfo

final class NewsDetailsReducerTests: XCTestCase {
    typealias TestStore = ComposableArchitecture.TestStore<
        NewsDetailsState,
        NewsDetailsState,
        NewsDetailsAction,
        NewsDetailsAction,
        NewsDetailsEnvironment
    >

    var sut: TestStore!
    var scheduler: TestSchedulerOf<DispatchQueue>!

    override func setUp() {
        scheduler = DispatchQueue.testScheduler
        sut = TestStore(
            initialState: NewsDetailsState(title: News.mock.news, newsId: News.mock.id),
            reducer: newsDetailsReducer,
            environment: NewsDetailsEnvironment(
                mainQueue: scheduler.eraseToAnyScheduler(),
                networkClient: .mock
            )
        )
    }

    override func tearDown() {
        sut = nil
        scheduler = nil
    }

    func testLoadDetails() {
        sut.assert(
            .send(.getDetails) {
                $0.isLoading = true
            },
            .do { self.scheduler.advance() },
            .receive(.didGetDetails(.success(.mock))) {
                $0.isLoading = false
                $0.newsDetials = .mock
            }
        )
    }
}
