// ----------------------------------------------------------------------------
//
//  ChatListViewController.swift
//
//  @author     Artem Lashmanov <https://github.com/qwite>
//  @copyright  Copyright (c) 2023
//
// ----------------------------------------------------------------------------

import PGPMessageDesignSystem
import UIKit

// ----------------------------------------------------------------------------

protocol ChatListViewProtocol: AnyObject {

// MARK: - Methods

    func updateChatListData(_ viewModel: [ChatListViewModel])
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

// MARK: - Methods

    func updateChatListData(_ viewModel: [ChatListViewModel]) {
        _chatListView.tableView.createSnapshot(with: viewModel)
    }
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
