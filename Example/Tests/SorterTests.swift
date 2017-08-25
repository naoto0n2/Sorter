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

    private var exampleItems: [Item] {
        return [
            Item(num: 1, text: "c"),
            Item(num: 2, text: "c"),
            Item(num: 1, text: "b"),
            Item(num: 2, text: "b"),
            Item(num: 1, text: "a"),
            Item(num: 2, text: "a")
        ]
    }

    private var expectedItems: [Item] {
        return [
            Item(num: 2, text: "a"),
            Item(num: 2, text: "b"),
            Item(num: 2, text: "c"),
            Item(num: 1, text: "a"),
            Item(num: 1, text: "b"),
            Item(num: 1, text: "c")
        ]
    }

    func testSorter1() {
        let items = self.exampleItems
        let expectedItems = self.expectedItems

        let sorterForNum = Sorter<Item> { $0.num > $1.num }
        let sorterForText = Sorter<Item> { $0.text < $1.text }
        let sorter = Sorter([sorterForNum, sorterForText])
        let result = items.sorted(by: sorter)

        XCTAssertEqual(result, expectedItems)
    }

    func testSorter2() {
        let items = self.exampleItems
        let expectedItems = self.expectedItems

        let sorterForNum = Sorter<Item>(asc: false) { $0.num }
        let sorterForText = Sorter<Item> { $0.text }
        let sorter = Sorter([sorterForNum, sorterForText])
        let result = items.sorted(by: sorter)

        XCTAssertEqual(result, expectedItems)
    }
}
