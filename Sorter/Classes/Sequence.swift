//
//  Sequence.swift
//  Pods
//
//  Created by Naoto Onagi on 2017/08/07.
//
//

import Foundation

public extension Sequence {
    public func sorted(by sorter: Sorter<Iterator.Element>) -> [Iterator.Element] {
        return self.sorted { sorter.descriptor($0.0, $0.1) }
    }
}
