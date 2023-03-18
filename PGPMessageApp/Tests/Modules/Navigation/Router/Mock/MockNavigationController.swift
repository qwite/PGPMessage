// ----------------------------------------------------------------------------
//
//  MockNavigationController.swift
//
//  @author     Artem Lashmanov <https://github.com/qwite>
//  @copyright  Copyright (c) 2023
//
// ----------------------------------------------------------------------------

import UIKit

// ----------------------------------------------------------------------------

internal final class MockNavigationController: UINavigationController {

// MARK: - Properties

    override var viewControllers: [UIViewController] {
        get {
            return _navigationStack
        }
        set {
            _navigationStack = newValue
        }
    }

// MARK: - Methods

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        self.viewControllers.append(viewController)
    }

    @discardableResult
    override func popViewController(animated: Bool) -> UIViewController? {
        self.viewControllers.removeLast()
    }

    @discardableResult
    override func popToViewController(_ viewController: UIViewController, animated: Bool) -> [UIViewController]? {

        if let index = self.viewControllers.firstIndex(of: viewController) {
            let nextIndex = index + 1
            self.viewControllers.removeSubrange(nextIndex...(self.viewControllers.count - 1))
        }

        return nil
    }

// MARK: - Variables

    private var _navigationStack: [UIViewController] = []
}
