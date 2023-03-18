// ----------------------------------------------------------------------------
//
//  MockBaseRouter.swift
//
//  @author     Artem Lashmanov <https://github.com/qwite>
//  @copyright  Copyright (c) 2023
//
// ----------------------------------------------------------------------------

@testable import PGPMessageApp

import UIKit

// ----------------------------------------------------------------------------

internal final class MockBaseRouter: BaseRouter {

// MARK: - Properties

    override var rootViewController: UINavigationController {
        get {
            return _mockNavigationController
        }
        set {
            // Do nothing
        }
    }

// MARK: - Methods

    override func push(_ viewController: UIViewController) {
        _mockNavigationController.pushViewController(viewController, animated: true)
    }

    override func pop() {
        _mockNavigationController.popViewController(animated: true)
    }

    override func popTo(_ viewController: UIViewController) {
        _mockNavigationController.popToViewController(viewController, animated: true)
    }

// MARK: - Variables

    private let _mockNavigationController = MockNavigationController()
}
