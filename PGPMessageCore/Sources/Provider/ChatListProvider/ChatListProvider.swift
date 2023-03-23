// ----------------------------------------------------------------------------
//
//  ChatListProvider.swift
//
//  @author     Artem Lashmanov <https://github.com/qwite>
//  @copyright  Copyright (c) 2023
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

public final class ChatListProvider: DataProvidable {

// MARK: - Construction

    public init() {

        // TODO("Add implementation for storing a Firebase service")
    }

// MARK: - Properties

    public var data: [ChatListModel]? {
        return loadChatListData()
    }

// MARK: - Private Methods

    private func loadChatListData() -> [ChatListModel]? {

        // TODO("Need a implementation for fetching data from Firebase service")

        let bundle = Bundle(for: type(of: self))

        guard let jsonModelUrl = bundle.url(forResource: "ChatList", withExtension: "json") else {
            return nil
        }

        guard let data = try? Data(contentsOf: jsonModelUrl) else {
            return nil
        }

        guard let chatList = try? JSONDecoder().decode([DataType].self, from: data) else {
            return nil
        }

        return chatList
    }

// MARK: - Inner Types

    public typealias DataType = ChatListModel
}
