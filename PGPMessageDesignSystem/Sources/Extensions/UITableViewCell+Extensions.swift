// ----------------------------------------------------------------------------
//
//  UITableViewCell+Extensions.swift
//
//  @author     Artem Lashmanov <https://github.com/qwite>
//  @copyright  Copyright (c) 2023
//
// ----------------------------------------------------------------------------

import UIKit

// ----------------------------------------------------------------------------

extension UITableViewCell {

// MARK: - Properties

    public static var reuseIdentifier: String {
        String(describing: self)
    }

    public var reuseIdentifier: String {
        type(of: self).reuseIdentifier
    }
}
