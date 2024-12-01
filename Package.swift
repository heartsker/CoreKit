// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

// swift-tools-version:5.3
import PackageDescription

let package = Package(
	name: "CoreKit",
	platforms: [
		.iOS(.v16)
	],
	products: [
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
		.target(
			name: "CoreTypes",
			dependencies: []
		),
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
			dependencies: ["CoreTypes"]
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
                "Logger"
            ]
        )
	]
)
