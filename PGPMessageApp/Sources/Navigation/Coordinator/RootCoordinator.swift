// ----------------------------------------------------------------------------
//
//  RootCoordinator.swift
//
//  @author     Artem Lashmanov <https://github.com/qwite>
//  @copyright  Copyright (c) 2023
//
// ----------------------------------------------------------------------------

enum RootRoute: Route {
    case chatList
}

// ----------------------------------------------------------------------------

final class RootCoordinator: BaseCoordinator<RootRoute> {

// MARK: - Construction

    override init(router: Routable = BaseRouter()) {
        super.init(router: router)
    }

// MARK: - Methods

    override func prepareTransition(_ route: RootRoute) {
        switch route {

            case .chatList:
                let chatListViewController = ChatListConfigurator.build()
                router.pushAsRoot(chatListViewController)
        }
    }
}
