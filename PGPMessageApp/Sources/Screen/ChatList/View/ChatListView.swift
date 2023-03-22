// ----------------------------------------------------------------------------
//
//  ChatListView.swift
//
//  @author     Artem Lashmanov <https://github.com/qwite>
//  @copyright  Copyright (c) 2023
//
// ----------------------------------------------------------------------------

import UIKit

// ----------------------------------------------------------------------------

final class ChatListView: UIView {

// MARK: - Construction

    init() {
        self.tableView = DiffableTableView<ChatListCell>()

        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        self.tableView = DiffableTableView<ChatListCell>()

        super.init(coder: coder)
    }
    
// MARK: - Properties

    let tableView: DiffableTableView<ChatListCell>

// MARK: - Methods

    override func layoutSubviews() {
        super.layoutSubviews()

        self.tableView.frame = self.frame
    }

    func setupViews() {
        self.backgroundColor = .white

        self.addSubview(tableView)
    }
}
