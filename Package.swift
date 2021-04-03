// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "JiraAPI",
    platforms: [.iOS(.v14), .macOS(.v11)],
    products: [
        .library(name: "JiraAPI", targets: ["JiraAPI"])
    ],
    dependencies: [],
    targets: [
        .target(name: "JiraAPI", dependencies: []),
        .testTarget(name: "JiraAPITests", dependencies: ["JiraAPI"])
    ]
)
