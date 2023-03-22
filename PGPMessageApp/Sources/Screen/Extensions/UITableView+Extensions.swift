// ----------------------------------------------------------------------------
//
//  UITableView+Extensions.swift
//
//  @author     Artem Lashmanov <https://github.com/qwite>
//  @copyright  Copyright (c) 2023
//
// ----------------------------------------------------------------------------

import UIKit

// ----------------------------------------------------------------------------

extension UITableView {

// MARK: - Methods

    func register<C: UITableViewCell>(_ cell: C.Type) {
        register(C.self, forCellReuseIdentifier: cell.reuseIdentifier)
    }
}
