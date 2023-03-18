// ----------------------------------------------------------------------------
//
//  BaseRouterTests.swift
//
//  @author     Artem Lashmanov <https://github.com/qwite>
//  @copyright  Copyright (c) 2023
//
// ----------------------------------------------------------------------------

import XCTest

@testable import PGPMessageApp

// ----------------------------------------------------------------------------

internal final class BaseRouterTests: XCTestCase {

// MARK: - Properties

    internal var sut: MockBaseRouter!

// MARK: - Methods

    override func setUp() {
        super.setUp()

        sut = MockBaseRouter()
    }

    override func tearDown() {
        sut = nil

        super.tearDown()
    }

// MARK: - Methods: Tests

    func testNavigationStackIsEqualOneAfterPushingOneViewController() {
        sut.push(UIViewController())

        XCTAssertEqual(sut.rootViewController.viewControllers.count, 1)
    }

    func testAfterPopToTargetOtherViewControllersAfterTargetMustBeRemoved() {

        sut.push(UIViewController())
        let vc2 = UIViewController()
        sut.push(vc2)
        sut.push(UIViewController())
        sut.push(UIViewController())
        sut.push(UIViewController())
        sut.push(UIViewController())

        sut.popTo(vc2)

        XCTAssertEqual(sut.rootViewController.viewControllers.count, 2)
    }

    func testNavigationStackIsEqualRandomNumberAfterPushingRandomNumberTimes() {
        let randomNumber = Int.random(in: 0..<20)

        for _ in 0..<randomNumber {
            let vc = UIViewController()

            sut.push(vc)
        }

        XCTAssertEqual(sut.rootViewController.viewControllers.count, randomNumber)
    }
}
