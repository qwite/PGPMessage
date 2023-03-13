// ----------------------------------------------------------------------------
//
//  AppDelegate.swift
//
//  @author     Artem Lashmanov <https://github.com/qwite>
//  @copyright  Copyright (c) 2023
//
// ----------------------------------------------------------------------------

import UIKit

// ----------------------------------------------------------------------------

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

// MARK: - Properties

    var window: UIWindow?

    var coordinator: RootCoordinator? {
        didSet {
            self.coordinator?.trigger(to: .chatList)
        }
    }

// MARK: - Methods

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?
    ) -> Bool {

        setupApplication()

        return true
    }

// MARK: - Private Methods

    private func setupApplication() {

        let window = UIWindow(frame: UIScreen.main.bounds)

        let coordinator = RootCoordinator()

        window.rootViewController = coordinator.router.rootViewController
        window.makeKeyAndVisible()

        self.window = window
        self.coordinator = coordinator
    }
}
