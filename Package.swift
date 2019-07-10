// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "XcodeGen",
    products: [
        .executable(name: "xcodegen", targets: ["XcodeGen"]),
        .library(name: "XcodeGenKit", targets: ["XcodeGenKit"]),
        .library(name: "ProjectSpec", targets: ["ProjectSpec"]),
    ],
    dependencies: [
        .package(url: "https://github.com/kylef/PathKit.git", from: "1.0.0"),
        .package(url: "https://github.com/jpsim/Yams.git", from: "2.0.0"),
        .package(url: "https://github.com/yonaskolb/JSONUtilities.git", from: "4.2.0"),
        .package(url: "https://github.com/kylef/Spectre.git", from: "0.9.0"),
        .package(url: "https://github.com/onevcat/Rainbow.git", from: "3.1.5"),
        .package(url: "https://github.com/KrakenDev/xcodeproj.git", .branch("master")),
        .package(url: "https://github.com/jakeheis/SwiftCLI.git", from: "5.3.2"),
    ],
    targets: [
        .target(name: "XcodeGen", dependencies: [
            "XcodeGenCLI",
        ]),
        .target(name: "XcodeGenCLI", dependencies: [
            "XcodeGenKit",
            "ProjectSpec",
            "SwiftCLI",
            "Rainbow",
            "PathKit",
        ]),
        .target(name: "XcodeGenKit", dependencies: [
            "ProjectSpec",
            "JSONUtilities",
            "XcodeProj",
            "PathKit",
        ]),
        .target(name: "ProjectSpec", dependencies: [
            "JSONUtilities",
            "XcodeProj",
            "Yams",
        ]),
        .testTarget(name: "XcodeGenKitTests", dependencies: [
            "XcodeGenKit",
            "Spectre",
            "PathKit",
        ]),
        .testTarget(name: "PerformanceTests", dependencies: [
            "XcodeGenKit",
            "Spectre",
            "PathKit",
        ]),
    ]
)
