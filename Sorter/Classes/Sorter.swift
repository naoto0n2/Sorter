//
//  Sorter.swift
//  Pods
//
//  Created by Naoto Onagi on 2017/08/07.
//
//

import Foundation

public struct Sorter<Value> {
    public typealias Descriptor<Value> = (Value, Value) -> Bool

    public let descriptor: Descriptor<Value>

    public init(descriptor: @escaping Descriptor<Value>) {
        self.descriptor = descriptor
    }

    public init(_ sorters: [Sorter<Value>]) {
        self.descriptor = { (lhs, rhs) -> Bool in
            for sorter in sorters {
                if sorter.descriptor(lhs, rhs) {
                    return true
                }
                if sorter.descriptor(rhs, lhs) {
                    return false
                }
            }
            return false
        }
    }
}

