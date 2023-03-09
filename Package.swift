// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CommonUI",
    products: [
        .library(
            name: "CommonUI",
            targets: ["CommonUI"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/airbnb/lottie-spm.git", from: "4.1.3"),
    ],
    targets: [
        .target(
            name: "CommonUI",
            dependencies: [
                .product(name: "Lottie", package: "lottie-spm")
            ]
        ),
        .testTarget(
            name: "CommonUITests",
            dependencies: ["CommonUI"]),
    ]
)
