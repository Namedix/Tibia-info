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

    override func setUp() {
        scheduler = DispatchQueue.testScheduler

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
    }

    func testSuccessGetNews() {
        let returnedNews: [News] = [.mock, .mock, .mock]
        sut.assert(
            .send(.getNews) {
                $0.isLoading = true
            },
            .do { self.scheduler.advance() },
            .receive(.didGetNews(.success(returnedNews))) {
                $0.isLoading = false
                $0.news = returnedNews
            }
        )
    }
}
