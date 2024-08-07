# CoreKit

SwiftCoreKit is a collection of Swift extensions and utilities that are essential for every iOS project. It is designed to be lightweight and easy to use. It is also designed to be modular, so you can use only the parts that you need.

## Installation

### Swift Package Manager

Add the following to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/heartsker/SwiftCoreKit.git", .upToNextMajor(from: "1.0.0"))
]
```

```swift
targets: [
    .target(
        name: "YourTarget",
        dependencies: ["CoreTypes"] // or any product you need
    )
]
```

## Usage
