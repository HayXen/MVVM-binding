//
//  Observable.swift
//  TestTask
//
//  Created by Hayk Ghazaryan on 15.09.21.
//

import Foundation


// MARK: Observable

class Observable<T> {

    var value: T?{
        didSet {
            listener?(value)
        }
    }

    private var listener: ((T?) -> Void)?

    init(_ value: T?) {
        self.value = value
    }

    func bind(_ listener: @escaping (T?) -> Void) {
        listener(value )
        self.listener = listener
    }
}

