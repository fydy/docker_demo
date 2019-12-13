// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "swift-kitura",
    dependencies: [
        .package(url: "https://github.com/IBM-Swift/Kitura.git", from: "2.4.0"),
    ],
    targets: [
        .target(name: "Run", dependencies: ["Kitura"]),
    ]
)
