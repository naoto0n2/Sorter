# Sorter

[![Version](https://img.shields.io/cocoapods/v/Sorter.svg?style=flat)](http://cocoapods.org/pods/Sorter)
[![License](https://img.shields.io/cocoapods/l/Sorter.svg?style=flat)](http://cocoapods.org/pods/Sorter)
[![Platform](https://img.shields.io/cocoapods/p/Sorter.svg?style=flat)](http://cocoapods.org/pods/Sorter)

Sorter with multiple conditions in Swift, such as NSSortDescriptor.

```swift
let items: [Item] = ...

// Create Sorter for each attribute
let sorterForNum = Sorter<Item>(asc: false) { $0.num }
let sorterForText = Sorter<Item>(asc: true) { $0.text }

// Create Sorter with multiple conditions
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

## Initializer
### 1. Initialize Sorter by comparable attribute
Default order is ascending.

```swift
Sorter<Item>(asc: false) { $0.num } // Pattern 1
Sorter<Item>(asc: true) { $0.num } // Pattern 2
Sorter<Item> { $0.num } // Pattern 3
```

### 2. Initialize Sorter by descriptor

```swift
Sorter<Item> { $0.text < $1.text }
```

### 3. Initialize Sorter by multiple conditions

```swift
Sorter([sorter1, sorter2])
Sorter([sorter1, sorter2, sorter3])
...
```

## Sort sequence
Sort items by sorter

```swift
let result = items.sort(by: sorter)
```

## Requirements

- Swift 4.0 or later
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
