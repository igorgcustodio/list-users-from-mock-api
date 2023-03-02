//
//  Observable.swift
//  ListUsers
//
//  Created by Igor Custodio on 02/03/23.
//

import Foundation

public class Observable<T> {

    public typealias ObservableType = (T) -> Void

    // MARK: - Properties

    private var observables: [ObservableType] = .empty

    /// Observable raw value
    public private(set) var value: T {
        didSet {
            executeBinds()
        }
    }

    // MARK: - Initialize

    /// Initializer
    ///
    /// - Parameter value: initial observable value
    public init(_ value: T) {
        self.value = value
    }

    // MARK: - Public Methods

    /// Bind value for changes
    ///
    /// - Parameters:
    ///   - value: accept new value in observable value
    public func notify(_ value: T) {
        self.value = value
    }

    /// - Parameters:
    ///   - skip: Should skip initial closure cell
    ///   - bind: closure to execute every time value changed
    public func observe(skip: Bool = false, _ bind: @escaping ObservableType) {
        observables.append(bind)
        if skip { return }
        bind(value)
    }

    // MARK: - Private Methods

    private func executeBinds() {
        observables.forEach { [weak self] bind in
            guard let self = self else { return }
            bind(self.value)
        }
    }
}
