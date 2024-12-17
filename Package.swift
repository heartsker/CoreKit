// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "CoreKit",
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
			name: "CoreTypes",
			targets: ["CoreTypes"]
		),
		.library(
			name: "CoreUtils",
			targets: ["CoreUtils"]
		),
		.library(
			name: "CoreUI",
			targets: ["CoreUI"]
		),
		.library(
			name: "Logger",
			targets: ["Logger"]
		),
		.library(
			name: "RxSweet",
			targets: ["RxSweet"]
		),
		.library(
            name: "NeedleDI",
            targets: ["NeedleDI"]
        ),
		.library(
			name: "CoreNetwork",
			targets: ["CoreNetwork"]
		),
        .library(
            name: "CoreRedux",
            targets: ["CoreRedux"]
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
                "CoreTypes",
                "CoreUtils",
                "CoreUI",
                "Logger",
                "RxSweet",
                "NeedleDI",
                "CoreNetwork",
                "CoreRedux"
            ]
        ),
		.target(name: "CoreTypes"),
		.testTarget(
			name: "CoreTypesTests",
            dependencies: ["CoreTypes"]
		),
		.target(
			name: "CoreUtils",
			dependencies: ["CoreTypes", "RxSweet"]
		),
		.target(
			name: "CoreUI",
			dependencies: ["CoreTypes", "CoreUtils"],
            resources: [
                .process("Resources")
            ]
		),
		.target(
			name: "Logger",
			dependencies: ["CoreTypes"]
		),
		.target(
			name: "RxSweet",
			dependencies: [
				"CoreTypes",
				"RxSwift",
				"Logger",
				.product(name: "RxRelay", package: "RxSwift")
			]
		),
		.target(
            name: "NeedleDI",
            dependencies: [
                "Logger",
                .product(name: "NeedleFoundation", package: "needle")
            ]
        ),
		.target(
			name: "CoreNetwork",
			dependencies: [
				"CoreTypes",
				"CoreUtils",
				"Logger"
			]
		),
        .target(
            name: "CoreRedux",
            dependencies: [
                "CoreTypes",
                "Logger"
            ]
        )
	]
)
