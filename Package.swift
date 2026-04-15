// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "TreeSitterIni",
    products: [
        .library(name: "TreeSitterIni", targets: ["TreeSitterIni"]),
    ],
    dependencies: [
        .package(name: "SwiftTreeSitter", url: "https://github.com/tree-sitter/swift-tree-sitter", from: "0.9.0"),
    ],
    targets: [
        .target(
            name: "TreeSitterIni",
            dependencies: [],
            path: ".",
            exclude: [
                "binding.gyp",
                "bindings/c",
                "bindings/go",
                "bindings/node",
                "bindings/python",
                "bindings/rust",
                "Cargo.toml",
                "Cargo.lock",
                "CMakeLists.txt",
                "go.mod",
                "grammar.js",
                "LICENSE",
                "Makefile",
                "notes.md",
                "package-lock.json",
                "package.json",
                "pyproject.toml",
                "README.md",
                "setup.py",
                "test",
                "test-awsconfig",
                "tree-sitter.json",
                "src/grammar.json",
                "src/node-types.json",
                ".editorconfig",
                ".gitattributes",
            ],
            sources: [
                "src/parser.c",
            ],
            resources: [
                .copy("queries"),
            ],
            publicHeadersPath: "bindings/swift",
            cSettings: [.headerSearchPath("src")],
        ),
        .testTarget(
            name: "TreeSitterIniTests",
            dependencies: [
                "SwiftTreeSitter",
                "TreeSitterIni",
            ],
            path: "bindings/swift/TreeSitterIniTests",
        ),
    ],
    cLanguageStandard: .c11,
)
