// ----------------------------------------------------------------------------
//
//  Routable.swift
//
//  @author     Artem Lashmanov <https://github.com/qwite>
//  @copyright  Copyright (c) 2023
//
// ----------------------------------------------------------------------------

import UIKit

// ----------------------------------------------------------------------------

protocol Routable {

// MARK: - Properties

    var rootViewController: UINavigationController { get set }

// MARK: - Methods

    func dismiss()

    func pop()

    func popTo(_ viewController: UIViewController)

    func present(_ viewController: UIViewController)

    func push(_ viewController: UIViewController)

    func pushAsRoot(_ viewController: UIViewController)
}
