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

        let rootViewController = UINavigationController(
            rootViewController: ChatListConfigurator.build()
        )

        window.rootViewController = rootViewController
        window.makeKeyAndVisible()

        self.window = window
    }
}
