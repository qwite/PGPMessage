import ProjectDescription

// MARK: - Dependencies

let dependencies = Dependencies(
    swiftPackageManager: [
        .remote(url: "https://github.com/alexito4/Flow", requirement: .upToNextMajor(from: "1.0.0")),
        .remote(url: "https://github.com/SnapKit/SnapKit", requirement: .upToNextMajor(from: "5.6.0")),
    ],
    platforms: [.iOS]
)
