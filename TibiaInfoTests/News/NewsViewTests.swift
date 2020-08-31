//
//  NewsViewTests.swift
//  TibiaInfoTests
//
//  Created by Namedix on 31/08/2020.
//  Copyright © 2020 Bartłomiej Pichalski. All rights reserved.
//

import XCTest
import SnapshotTesting
import ComposableArchitecture

@testable import TibiaInfo

final class NewsViewTests: XCTestCase {

    func testLoadingState() {
        assertSnapshot(
            matching: NewsView(
                store: Store(
                    initialState: NewsState(isLoading: true),
                    reducer: .empty,
                    environment: ()
            )
        ),
            as: .image(layout: .device(config: .iPhoneXr)))
    }

    func testErrorState() {
        assertSnapshot(
            matching: NewsView(
                store: Store(
                    initialState: NewsState(),
                    reducer: .empty,
                    environment: ()
                )
            ),
            as: .image(layout: .device(config: .iPhoneXr)))
    }

    func testSuccessState() {
        assertSnapshot(
            matching: NewsView(
                store: Store(
                    initialState: NewsState(news: [.mock, .mock, .mock]),
                    reducer: .empty,
                    environment: ()
                )
            ),
            as: .image(layout: .device(config: .iPhoneXr)))
    }
}
