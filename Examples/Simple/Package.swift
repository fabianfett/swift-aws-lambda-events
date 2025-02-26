// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "swift-aws-lambda-events-samples",
    platforms: [
        .macOS(.v10_13),
    ],
    products: [
        // demonstrate how to integrate with AWS API Gateway
        .executable(name: "APIGateway", targets: ["APIGateway"]),
    ],
    dependencies: [
        // this is the dependency on the swift-aws-lambda-runtime library
        // in real-world projects this would say
        // FIXME: update this once the https://github.com/swift-server/swift-aws-lambda-runtime/pull/216 is merged
        // .package(url: "https://github.com/swift-server/swift-aws-lambda-runtime.git", from: "1.0.0")
        .package(url: "https://github.com/tomerd/swift-aws-lambda-runtime.git", .branch("remove-events")),
        // this is the dependency on the swift-aws-lambda-events library
        // .package(url: "https://github.com/swift-server/swift-aws-lambda-runtime-events.git", from: "1.0.0")
        .package(name: "swift-aws-lambda-events", path: "../.."),
    ],
    targets: [
        .target(name: "APIGateway", dependencies: [
            .product(name: "AWSLambdaRuntime", package: "swift-aws-lambda-runtime"),
            .product(name: "AWSLambdaEvents", package: "swift-aws-lambda-events"),
        ]),
    ]
)
