//
//  NewsDetailsViewTests.swift
//  TibiaInfoTests
//
//  Created by Namedix on 31/08/2020.
//  Copyright © 2020 Bartłomiej Pichalski. All rights reserved.
//

import XCTest
import SnapshotTesting
import ComposableArchitecture
@testable import TibiaInfo

final class NewsDetialsViewTests: XCTestCase {

    func testLoadingState() {
        assertSnapshot(
            matching: NewsDetailsView(
                store: Store(
                    initialState: NewsDetailsState(title: News.mock.news, newsId: News.mock.id, isLoading: true),
                    reducer: .empty,
                    environment: ()
                )
            ),
            as: .image(layout: .device(config: .iPhoneXr))
        )
    }

    func testErrorState() {
        assertSnapshot(
            matching: NewsDetailsView(
                store: Store(
                    initialState: NewsDetailsState(title: News.mock.news, newsId: News.mock.id, isLoading: false),
                    reducer: .empty,
                    environment: ()
                )
            ),
            as: .image(layout: .device(config: .iPhoneXr))
        )
    }

    func testSuccessState() {
        assertSnapshot(
            matching: NewsDetailsView(
                store: Store(
                    initialState: NewsDetailsState(title: News.mock.news, newsId: News.mock.id, newsDetials: .mock),
                    reducer: .empty,
                    environment: ()
                )
            ),
            as: .image(layout: .device(config: .iPhoneXr))
        )
    }
}
