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
		)
	],
	dependencies: [],
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
		)
	]
)
