// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "swift-http-server",
    dependencies: [
        .package(url: "https://github.com/swift-server/http.git", from: "0.1.0"),
    ],
    targets: [
        .target(name: "Run", dependencies: ["HTTP"]),
    ]
)
