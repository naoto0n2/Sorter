//
//  SorterTests.swift
//  Sorter
//
//  Created by Naoto Onagi on 2017/08/07.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import XCTest
import Sorter

class SorterTests: XCTestCase {
    
    private struct Item: Equatable {
        let num: Int
        let text: String

        static func == (lhs: Item, rhs: Item) -> Bool {
            return lhs.num == rhs.num && lhs.text == rhs.text
        }
    }

    func testSorter() {
        let items = self.exampleItems()
        let expectedItems = [
            Item(num: 2, text: "a"),
            Item(num: 2, text: "b"),
            Item(num: 2, text: "c"),
            Item(num: 1, text: "a"),
            Item(num: 1, text: "b"),
            Item(num: 1, text: "c")
        ]

        let sorterForNum = Sorter<Item> { $0.0.num > $0.1.num }
        let sorterForText = Sorter<Item> { $0.0.text < $0.1.text }
        let sorter = Sorter([sorterForNum, sorterForText])
        let result = items.sorted(by: sorter)

        XCTAssertEqual(result, expectedItems)
    }

    private func exampleItems() -> [Item] {
        return [
            Item(num: 1, text: "c"),
            Item(num: 2, text: "c"),
            Item(num: 1, text: "b"),
            Item(num: 2, text: "b"),
            Item(num: 1, text: "a"),
            Item(num: 2, text: "a")
        ]
    }
}
