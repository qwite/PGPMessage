// ----------------------------------------------------------------------------
//
//  ChatListCell.swift
//
//  @author     Artem Lashmanov <https://github.com/qwite>
//  @copyright  Copyright (c) 2023
//
// ----------------------------------------------------------------------------

import PGPMessageDesignSystem
import SnapKit
import UIKit

// ----------------------------------------------------------------------------

final class ChatListCell:
    UITableViewCell,
    Providable {

// MARK: - Properties

    let avatarView: UIView = {
        let avatarView = UIView()

        avatarView.layer.borderColor = UIColor.black.cgColor
        avatarView.layer.borderWidth = Dimension.avatarViewLayerBorderWidth
        avatarView.layer.cornerRadius = Dimension.avatarViewLayerCornerRadius

        return avatarView
    }()

    let senderNameLabel: UILabel = {
        let senderNameLabel = UILabel()

        senderNameLabel.font = Font.caption

        return senderNameLabel
    }()

    let messageLabel: UILabel = {
        let messageLabel = UILabel()

        messageLabel.font = Font.caption

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
        setupAvatarView()
        setupLabels()
    }

    private func setupAvatarView() {
        self.addSubview(self.avatarView)

        self.avatarView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(Dimension.avatarViewTop)
            $0.leading.equalToSuperview().offset(Dimension.avatarViewLeading)
            $0.bottom.equalToSuperview().inset(Dimension.avatarViewBottom)
            $0.width.equalTo(Dimension.avatarViewWidth)
        }
    }

    private func setupLabels() {
        self.addSubview(self.senderNameLabel)

        self.senderNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(Dimension.senderNameLabelTop)
            $0.leading.equalTo(self.avatarView.snp.trailing).offset(Dimension.senderNameLabelLeading)
        }

        self.addSubview(messageLabel)

        self.messageLabel.snp.makeConstraints {
            $0.top.equalTo(self.senderNameLabel.snp.bottom).offset(Dimension.messageLabelTop)
            $0.leading.equalTo(self.senderNameLabel.snp.leading)
        }
    }

// MARK: - Constants

    private enum Dimension {
        static let avatarViewLayerBorderWidth: CGFloat = 1.0
        static let avatarViewLayerCornerRadius: CGFloat = 8.0

        static let avatarViewTop: CGFloat = 8.0
        static let avatarViewLeading: CGFloat = 2.0
        static let avatarViewBottom: CGFloat = 2.0
        static let avatarViewWidth: CGFloat = 44.0

        static let senderNameLabelTop: CGFloat = 8.0
        static let senderNameLabelLeading: CGFloat = 8.0

        static let messageLabelTop: CGFloat = 4.0
    }

// MARK: - Inner Types

    typealias ProvidedItem = ChatListViewModel
}
