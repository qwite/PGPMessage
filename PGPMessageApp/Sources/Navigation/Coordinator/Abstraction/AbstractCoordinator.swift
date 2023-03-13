// ----------------------------------------------------------------------------
//
//  AbstractCoordinator.swift
//
//  @author     Artem Lashmanov <https://github.com/qwite>
//  @copyright  Copyright (c) 2023
//
// ----------------------------------------------------------------------------

class AbstractCoordinator<R: Route> {

// MARK: - Construction

    init() {
        // Do nothing
    }

// MARK: - Methods

    func trigger(to route: R) {
        prepareTransition(route)
    }

    func prepareTransition(_ route: R) {
        fatalError("Method must be implemented in child class.")
    }
}
