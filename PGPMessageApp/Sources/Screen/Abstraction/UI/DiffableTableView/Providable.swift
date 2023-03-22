// ----------------------------------------------------------------------------
//
//  Providable.swift
//
//  @author     Artem Lashmanov <https://github.com/qwite>
//  @copyright  Copyright (c) 2023
//
// ----------------------------------------------------------------------------

protocol Providable {

    associatedtype ProvidedItem: Hashable

// MARK: - Methods

    func provide(_ item: ProvidedItem)
}
