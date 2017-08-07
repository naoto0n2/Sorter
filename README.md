# Sorter

[![Version](https://img.shields.io/cocoapods/v/Sorter.svg?style=flat)](http://cocoapods.org/pods/Sorter)
[![License](https://img.shields.io/cocoapods/l/Sorter.svg?style=flat)](http://cocoapods.org/pods/Sorter)
[![Platform](https://img.shields.io/cocoapods/p/Sorter.svg?style=flat)](http://cocoapods.org/pods/Sorter)

Sorter with multiple conditions in Swift, such as NSSortDescriptor.

```swift
struct Item {
    let num: Int
    let text: String
}

let items = [
    Item(num: 1, text: "c"),
    Item(num: 2, text: "c"),
    Item(num: 1, text: "b"),
    Item(num: 2, text: "b"),
    Item(num: 1, text: "a"),
    Item(num: 2, text: "a")
]

// Sorter for num in descending order
let sorterForNum = Sorter<Item> { $0.0.num > $0.1.num }

// Sorter for text in ascending order
let sorterForText = Sorter<Item> { $0.0.text < $0.1.text }

// Create sorter with multiple conditions
let sorter = Sorter([sorterForNum, sorterForText])

// Get sorted result
let result = items.sorted(by: sorter)

/*
result: [
    Item(num: 2, text: "a"),
    Item(num: 2, text: "b"),
    Item(num: 2, text: "c"),
    Item(num: 1, text: "a"),
    Item(num: 1, text: "b"),
    Item(num: 1, text: "c")
]
*/
```

## Requirements

- Swift 3.0 or later
- iOS 8.0 or later

## Installation

#### [CocoaPods](https://github.com/cocoapods/cocoapods)

- Insert `pod 'Sorter'` to your Podfile.
- Run `pod install`.

Note: CocoaPods 1.1.0 is required to install Sorter.

## Author

Naoto Onagi, naoto.0n2@gmail.com

## License

Sorter is available under the MIT license. See the LICENSE file for more info.
