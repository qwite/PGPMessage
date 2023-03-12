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

        _chatListView.setupViews()

        self.presenter.viewIsReady()
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
