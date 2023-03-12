// ----------------------------------------------------------------------------
//
//  ChatListPresenter.swift
//
//  @author     Artem Lashmanov <https://github.com/qwite>
//  @copyright  Copyright (c) 2023
//
// ----------------------------------------------------------------------------

protocol ChatListPresenterProtocol: AnyObject {

// MARK: - Methods

    func viewIsReady()
}

// ----------------------------------------------------------------------------

final class ChatListPresenter {

// MARK: - Construction

    init(view: ChatListViewProtocol) {
        _view = view
    }

// MARK: - Properties

    private weak var _view: ChatListViewProtocol?
}

// ----------------------------------------------------------------------------
// MARK: - @protocol ChatListPresenterProtocol
// ----------------------------------------------------------------------------

extension ChatListPresenter: ChatListPresenterProtocol {

// MARK: - Methods

    func viewIsReady() {
        // Do nothing
    }
}
