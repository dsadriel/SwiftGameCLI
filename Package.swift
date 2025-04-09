// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftGameCLI",
    platforms: [.macOS(.v11)],
    products: [
        .library(
            name: "SwiftGameCLI",
            targets: ["SwiftGameCLI"]),
    ],
    targets: [
        .target(
            name: "SwiftGameCLI")
    ]
)
