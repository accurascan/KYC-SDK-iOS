// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "AccuraOCR",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        // Device-only (arm64) binary framework. Simulator is not supported.
        .library(name: "AccuraOCR", targets: ["AccuraOCRSPM"])
    ],
    dependencies: [
        .package(url: "https://git.accurascan.com/mahdi/tensorflow", exact: "0.4.2")
    ],
    targets: [
        .binaryTarget(
            name: "AccuraOCR",
            url: "https://github.com/accurascan/KYC-SDK-iOS/releases/download/1.0.1/AccuraOCR.xcframework.zip",
            checksum: "14cb20b471bc746133666df91fbec50f97fc44b8768970ce47accb2896add84e"
        ),
        // Dynamic frameworks that AccuraOCR.framework loads at launch via @rpath.
        // Built from CocoaPods: PromisesObjC 2.4.1, GoogleDataTransport 10.1.1, GoogleUtilities 8.1.5,
        // nanopb 3.30910.0, GTMSessionFetcher 5.3.1, GoogleToolboxForMac 6.0.1, SVProgressHUD 2.3.1.
        .binaryTarget(name: "FBLPromises", path: "Frameworks/FBLPromises.xcframework"),
        .binaryTarget(name: "GoogleDataTransport", path: "Frameworks/GoogleDataTransport.xcframework"),
        .binaryTarget(name: "GoogleUtilities", path: "Frameworks/GoogleUtilities.xcframework"),
        .binaryTarget(name: "nanopb", path: "Frameworks/nanopb.xcframework"),
        .binaryTarget(name: "GTMSessionFetcher", path: "Frameworks/GTMSessionFetcher.xcframework"),
        .binaryTarget(name: "GoogleToolboxForMac", path: "Frameworks/GoogleToolboxForMac.xcframework"),
        .binaryTarget(name: "SVProgressHUD", path: "Frameworks/SVProgressHUD.xcframework"),
        .target(
            name: "AccuraOCRSPM",
            dependencies: [
                "AccuraOCR",
                .product(name: "TensorFlowLiteTaskVision", package: "Tensorflow"),
                "FBLPromises",
                "GoogleDataTransport",
                "GoogleUtilities",
                "nanopb",
                "GTMSessionFetcher",
                "GoogleToolboxForMac",
                "SVProgressHUD"
            ],
            path: "Sources/AccuraOCRSPM"
        )
    ]
)
