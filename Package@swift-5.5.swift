// swift-tools-version:5.5
// In order to support users running on previous versions of Xcode, please ensure that
// Package.swift is kept in sync with this file.
/*
 This source file is part of the Swift.org open source project

 Copyright (c) 2021 Apple Inc. and the Swift project authors
 Licensed under Apache License v2.0 with Runtime Library Exception

 See https://swift.org/LICENSE.txt for license information
 See https://swift.org/CONTRIBUTORS.txt for Swift project authors
 
 EDITING on forked version by: xxcat0(jakub.kornatowski@allegro.pl)
*/

import PackageDescription

let package = Package(
    name: "swift-markdown",
    products: [
        .library(
            name: "Markdown",
            targets: ["Markdown"]),
    ],
    targets: [
        .target(
            name: "Markdown",
            dependencies: [
                "CAtomic",
                .product(name: "cmark-gfm", package: "swift-cmark"),
                .product(name: "cmark-gfm-extensions", package: "swift-cmark"),
            ]),
        .executableTarget(
            name: "markdown-tool",
            dependencies: [
                "Markdown",
                .product(name: "ArgumentParser", package: "swift-argument-parser")
            ]),
        .testTarget(
            name: "MarkdownTests",
            dependencies: ["Markdown"],
            resources: [.process("Visitors/Everything.md")]),
        .target(name: "CAtomic"),
    ]
)

package.dependencies += [
    .package(path: "Sources/swift-cmark"),
    .package(url: "https://github.com/apple/swift-argument-parser", .upToNextMinor(from: "1.0.1")),
]
