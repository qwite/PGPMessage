// ----------------------------------------------------------------------------
//
//  ChatListModel+Extensions.swift
//
//  @author     Artem Lashmanov <https://github.com/qwite>
//  @copyright  Copyright (c) 2023
//
// ----------------------------------------------------------------------------

import PGPMessageCore

// ----------------------------------------------------------------------------

extension ChatListModel {

// MARK: - Methods

    func toViewModel() -> ChatListViewModel {
        return ChatListViewModel(
            senderName: self.senderName,
            message: self.messageText
        )
    }
}
