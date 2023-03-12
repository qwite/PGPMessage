// ----------------------------------------------------------------------------
//
//  ChatListConfigurator.swift
//
//  @author     Artem Lashmanov <https://github.com/qwite>
//  @copyright  Copyright (c) 2023
//
// ----------------------------------------------------------------------------

import UIKit

// ----------------------------------------------------------------------------

final class ChatListConfigurator {

// MARK: - Methods

    static func build() -> UIViewController {
        let viewController = ChatListViewController()
        let presenter = ChatListPresenter(view: viewController)

        viewController.presenter = presenter
        return viewController
    }
}
