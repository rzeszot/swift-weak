// swift-tools-version:5.5

import PackageDescription

let package = Package(
  name: "Weak",
  products: [
    .library(name: "Weak", targets: ["Weak"])
  ],
  targets: [
    .target(name: "Weak"),
    .testTarget(name: "WeakTests", dependencies: ["Weak"])
  ]
)
