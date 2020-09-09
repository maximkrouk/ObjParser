// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "ObjParser",
    products: [
        .library(
            name: "ObjParser",
            targets: [
                "ObjParser"
            ]
        ),
    ],
    targets: [
        .target(name: "ObjParser"),
        .testTarget(
            name: "ObjParserTests",
            dependencies: [
                .target(name: "ObjParser")
            ]
        ),
    ]
)
