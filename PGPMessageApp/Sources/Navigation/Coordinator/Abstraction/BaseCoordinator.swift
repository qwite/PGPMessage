// ----------------------------------------------------------------------------
//
//  BaseCoordinator.swift
//
//  @author     Artem Lashmanov <https://github.com/qwite>
//  @copyright  Copyright (c) 2023
//
// ----------------------------------------------------------------------------

import UIKit

// ----------------------------------------------------------------------------

class BaseCoordinator<R: Route>: AbstractCoordinator<R> {

// MARK: - Construction

    init(router: Routable) {
        self.router = router
    }

// MARK: - Properties

    let router: Routable
}
