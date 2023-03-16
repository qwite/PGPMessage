// ----------------------------------------------------------------------------
//
//  ChatListViewControllerTests.swift
//
//  @author     Artem Lashmanov <https://github.com/qwite>
//  @copyright  Copyright (c) 2023
//
// ----------------------------------------------------------------------------

import XCTest

@testable import PGPMessageApp

// ----------------------------------------------------------------------------

final class ChatListViewControllerTests: XCTestCase {

// MARK: Properties

    internal var sut: UIViewController!

// MARK: - Methods

    override func setUp() {
        super.setUp()

        sut = ChatListConfigurator.build()
    }

// MARK: - Methods: Tests

    internal func testSutViewIsEqualChatListViewType() {
        sut.viewDidLoad()

        XCTAssertTrue(sut.view is ChatListView)
    }

    internal func testSutTitle() {
        sut.viewDidLoad()

        XCTAssertEqual(sut.title, "Chats")
    }

    internal func testSutViewBackgroundColor() {
        sut.viewDidLoad()

        XCTAssertEqual(sut.view.backgroundColor, UIColor.white)
    }
}

