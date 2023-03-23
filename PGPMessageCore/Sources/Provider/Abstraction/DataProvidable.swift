// ----------------------------------------------------------------------------
//
//  DataProvidable.swift
//
//  @author     Artem Lashmanov <https://github.com/qwite>
//  @copyright  Copyright (c) 2023
//
// ----------------------------------------------------------------------------

protocol DataProvidable {

    associatedtype DataType

// MARK: - Properties

    var data: [DataType]? { get }
}
