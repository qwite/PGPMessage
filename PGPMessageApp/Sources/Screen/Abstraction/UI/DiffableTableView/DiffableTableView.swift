// ----------------------------------------------------------------------------
//
//  DiffableTableView.swift
//
//  @author     Artem Lashmanov <https://github.com/qwite>
//  @copyright  Copyright (c) 2023
//
// ----------------------------------------------------------------------------

import Flow
import UIKit

// ----------------------------------------------------------------------------

final class DiffableTableView<C: UITableViewCell & Providable>:
    UITableView {

// MARK: - Methods

    func createDiffableDataSource() -> DiffableDataSource {

        let diffableDataSource = DiffableDataSource(tableView: self, cellProvider: cellProvider)
        _diffableDataSource = diffableDataSource

        return diffableDataSource
    }

    func createSnapshot(with items: [Item]) {

        let snapshot = NSDiffableDataSourceSnapshot<Section, Item>().then {
            $0.appendSections([.main])
            $0.appendItems(items, toSection: .main)
        }

        _diffableDataSource?.apply(snapshot)
    }

    func appendItem(_ item: Item) {

        let snapshot = _diffableDataSource?.snapshot().then {
            $0.appendItems([item])
        }

        guard let snapshot else { return }

        _diffableDataSource?.apply(snapshot)
    }

// MARK: - Private Methods

    private func cellProvider(
        _ tableView: UITableView,
        _ indexPath: IndexPath,
        _ itemIdentifier: Item
    ) -> UITableViewCell? {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: C.reuseIdentifier, for: indexPath)
                as? C else {
            return nil
        }

        cell.provide(itemIdentifier)

        return cell
    }

// MARK: - Inner Types

    enum Section: Hashable {
        case main
    }

    typealias DiffableDataSource = UITableViewDiffableDataSource<Section, Item>
    typealias Item = C.ProvidedItem

// MARK: - Variables

    private var _diffableDataSource: DiffableDataSource?
    private var _items: [Item] = []
}
