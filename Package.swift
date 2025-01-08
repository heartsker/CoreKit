// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "CoreKit",
    defaultLocalization: "en",
	platforms: [
		.iOS(.v16)
	],
	products: [
        // Umbrella library, which includes all other libraries
        .library(
            name: "CoreKit",
            targets: ["CoreKit"]
        ),
        .library(
            name: "CoreDI",
            targets: ["CoreDI"]
        ),
        .library(
            name: "CoreLocalizer",
            targets: ["CoreLocalizer"]
        ),
        .library(
            name: "CoreLogger",
            targets: ["CoreLogger"]
        ),
        .library(
            name: "CoreNetwork",
            targets: ["CoreNetwork"]
        ),
        .library(
            name: "CoreReactive",
            targets: ["CoreReactive"]
        ),
        .library(
            name: "CoreRedux",
            targets: ["CoreRedux"]
        ),
		.library(
			name: "CoreTypes",
			targets: ["CoreTypes"]
		),
		.library(
			name: "CoreUI",
			targets: ["CoreUI"]
		),
        .library(
            name: "CoreUtils",
            targets: ["CoreUtils"]
        )
	],
	dependencies: [
        .package(url: "https://github.com/ReactiveX/RxSwift.git", branch: "main"),
        .package(url: "https://github.com/uber/needle.git", branch: "master")
	],
    targets: [
        // Umbrella target
        .target(
            name: "CoreKit",
            dependencies: [
                "CoreDI",
                "CoreLocalizer",
                "CoreLogger",
                "CoreNetwork",
                "CoreReactive",
                "CoreRedux",
                "CoreTypes",
                "CoreUI",
                "CoreUtils"
            ]
        ),
        .target(
            name: "CoreDI",
            dependencies: [
                "CoreLogger",
                .product(name: "NeedleFoundation", package: "needle")
            ]
        ),
        .target(
            name: "CoreLocalizer",
            resources: [
                .process("Resources")
            ]
        ),
        .target(
            name: "CoreLogger",
            dependencies: ["CoreTypes"]
        ),
        .target(
            name: "CoreNetwork",
            dependencies: [
                "CoreLogger",
                "CoreTypes",
                "CoreUtils"
            ]
        ),
        .target(
            name: "CoreReactive",
            dependencies: [
                "CoreLogger",
                "CoreTypes",
                "RxSwift",
                .product(name: "RxRelay", package: "RxSwift")
            ]
        ),
        .target(
            name: "CoreRedux",
            dependencies: [
                "CoreLogger",
                "CoreTypes",
                "CoreUtils"
            ]
        ),
		.target(name: "CoreTypes"),
		.testTarget(
			name: "CoreTypesTests",
            dependencies: ["CoreTypes"]
		),
        .target(
            name: "CoreUI",
            dependencies: ["CoreTypes", "CoreUtils"],
            resources: [
                .process("Assets/Resources")
            ]
        ),
		.target(
			name: "CoreUtils",
			dependencies: ["CoreTypes", "CoreReactive"]
		)
	]
)
