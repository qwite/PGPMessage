// ----------------------------------------------------------------------------
//
//  ChatListPresenter.swift
//
//  @author     Artem Lashmanov <https://github.com/qwite>
//  @copyright  Copyright (c) 2023
//
// ----------------------------------------------------------------------------

import PGPMessageCore

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

// MARK: - Private Methods

    func loadChatListData() {
        let chatListProvider = ChatListProvider()

        guard let chatListData = chatListProvider.data else {
            return
        }

        let chatListViewModel: [ChatListViewModel] = chatListData
            .map { $0.toViewModel() }

        _view?.updateChatListData(chatListViewModel)
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
        loadChatListData()
    }
}
