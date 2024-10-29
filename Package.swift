// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

// swift-tools-version:5.3
import PackageDescription

let package = Package(
	name: "CoreKit",
	platforms: [
		.macOS(.v10_15),
		.iOS(.v13),
		.tvOS(.v13),
		.watchOS(.v6)
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
		)
	],
	dependencies: [
		.package(url: "https://github.com/ReactiveX/RxSwift.git", branch: "main")
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
			dependencies: ["CoreTypes"]
		),
		.testTarget(
			name: "CoreUtilsTests",
			dependencies: ["CoreUtils"]
		),
		.target(
			name: "Logger",
			dependencies: ["CoreTypes"]
		),
		.testTarget(
			name: "LoggerTests",
			dependencies: ["Logger"]
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
		.testTarget(
            name: "RxSweetTests",
            dependencies: ["RxSweet"]
        ),
		.target(
            name: "NeedleDI",
            dependencies: [
                "Logger"
            ]
        ),
        .testTarget(
            name: "NeedleDITests",
            dependencies: ["NeedleDI"]
        ),
		.target(
			name: "CoreNetwork",
			dependencies: [
				"CoreTypes",
				"CoreUtils",
				"Logger"
			]
		),
		.testTarget(
			name: "CoreNetworkTests",
			dependencies: ["CoreNetwork"]
		)
	]
)
