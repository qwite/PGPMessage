// ----------------------------------------------------------------------------
//
//  ChatListCell.swift
//
//  @author     Artem Lashmanov <https://github.com/qwite>
//  @copyright  Copyright (c) 2023
//
// ----------------------------------------------------------------------------

import UIKit

// ----------------------------------------------------------------------------

final class ChatListCell:
    UITableViewCell,
    Providable {

// MARK: - Properties

    let avatarView: UIView = {
        let avatarView = UIView()

        avatarView.layer.borderWidth = 1.0
        avatarView.layer.borderColor = UIColor.black.cgColor
        avatarView.layer.cornerRadius = 8.0

        avatarView.translatesAutoresizingMaskIntoConstraints = false
        return avatarView
    }()

    let senderNameLabel: UILabel = {
        let senderNameLabel = UILabel()

        senderNameLabel.font = UIFont.preferredFont(forTextStyle: .caption1)

        senderNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return senderNameLabel
    }()

    let messageLabel: UILabel = {
        let messageLabel = UILabel()

        messageLabel.font = UIFont.preferredFont(forTextStyle: .caption1)

        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        return messageLabel
    }()

// MARK: - Methods

    func provide(_ item: ProvidedItem) {
        self.senderNameLabel.text = item.senderName
        self.messageLabel.text = item.message

        setupViews()
    }

// MARK: - Private Methods

    private func setupViews() {

        self.addSubview(self.avatarView)
        self.addSubview(self.senderNameLabel)
        self.addSubview(self.messageLabel)

        NSLayoutConstraint.activate([
            self.avatarView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 2.0),
            self.avatarView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8.0),
            self.avatarView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -2.0),
            self.avatarView.widthAnchor.constraint(equalToConstant: 44.0),

            self.senderNameLabel.leadingAnchor.constraint(equalTo: self.avatarView.trailingAnchor, constant: 8.0),
            self.senderNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8.0),

            self.messageLabel.topAnchor.constraint(equalTo: self.senderNameLabel.bottomAnchor, constant: 4.0),
            self.messageLabel.leadingAnchor.constraint(equalTo: self.senderNameLabel.leadingAnchor),
        ])
    }

// MARK: - Inner Types

    typealias ProvidedItem = ChatListViewModel
}
