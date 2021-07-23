// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "libavif",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "libavif",
            targets: ["libavif"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/SDWebImage/libaom-Xcode.git", from: "2.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "libavif",
            dependencies: ["libaom"],
            path: "avif",
            exclude: ["src/codec_dav1d.c", "src/codec_rav1e.c", "src/codec_libgav1.c", "src/codec_svt.c"],
            sources: ["src"],
            publicHeadersPath: "include",
            cSettings: [.define("AVIF_CODEC_AOM", to: "1"), .define("AVIF_CODEC_AOM_DECODE", to: "1"), .define("AVIF_CODEC_AOM_ENCODE", to: "1")]
        )
    ],
    cLanguageStandard: .gnu11,
    cxxLanguageStandard: .gnucxx14
)
