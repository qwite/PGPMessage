// ----------------------------------------------------------------------------
//
//  BaseRouter.swift
//
//  @author     Artem Lashmanov <https://github.com/qwite>
//  @copyright  Copyright (c) 2023
//
// ----------------------------------------------------------------------------

import UIKit

// ----------------------------------------------------------------------------

class BaseRouter: Routable {

// MARK: - Construction

    init() {
        // Do nothing
    }

    deinit {
        clearNavigationStack()
    }

// MARK: - Properties

    lazy var rootViewController: UINavigationController = _navigationController

// MARK: - Methods

    func dismiss() {
        _navigationController.dismiss(animated: true)
    }

    func pop() {
        _navigationController.popViewController(animated: true)
    }

    func present(_ viewController: UIViewController) {
        _navigationController.present(viewController, animated: true)
    }

    func push(_ viewController: UIViewController, asRoot: Bool) {

        if asRoot {
            pushAsRoot(viewController); return
        }

        _navigationController.pushViewController(viewController, animated: true)
    }

// MARK: - Private Methods

    private func pushAsRoot(_ viewController: UIViewController) {
        _navigationController.viewControllers = [viewController]
    }

    private func clearNavigationStack() {
        _navigationController.viewControllers = []
    }

// MARK: - Variables

    private let _navigationController = UINavigationController()
}
