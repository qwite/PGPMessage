// ----------------------------------------------------------------------------
//
//  ChatListViewController.swift
//
//  @author     Artem Lashmanov <https://github.com/qwite>
//  @copyright  Copyright (c) 2023
//
// ----------------------------------------------------------------------------

import UIKit

// ----------------------------------------------------------------------------

protocol ChatListViewProtocol: AnyObject {
    // Do nothing
}

// ----------------------------------------------------------------------------

final class ChatListViewController: UIViewController {

// MARK: - Properties

    var presenter: ChatListPresenterProtocol!

// MARK: - Methods

    override func loadView() {
        self.view = _chatListView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()

        self.presenter.viewIsReady()
    }

// MARK: - Private Methods

    private func setupViews() {

        self.title = Title.chats

        _chatListView.setupViews()
        setupTableView()
    }

    private func setupTableView() {
        let tableView = _chatListView.tableView

        tableView.register(ChatListCell.self)
        tableView.delegate = self
        tableView.dataSource = tableView.createDiffableDataSource()

        tableView.rowHeight = Dimension.tableViewRowHeight
    }

// MARK: - Constants

    private enum Dimension {
        static let tableViewRowHeight: CGFloat = 44.0
    }

    private enum Title {
        static let chats = "Chats"
    }

// MARK: - Variables

    private var _chatListView = ChatListView()
}

// ----------------------------------------------------------------------------
// MARK: - @protocol ChatListViewProtocol
// ----------------------------------------------------------------------------

extension ChatListViewController: ChatListViewProtocol {
    // Do nothing
}

// ----------------------------------------------------------------------------
// MARK: - @protocol UITableViewDelegate
// ----------------------------------------------------------------------------

extension ChatListViewController: UITableViewDelegate {

// MARK: - Methods

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
