import ProjectDescription

// MARK: - Project

let project = Project(
    name: "PGPMessageCore",
    targets: [
        Target(
            name: "PGPMessageCore",
            platform: .iOS,
            product: .framework,
            bundleId: "ru.lashmanov.PGPMessageCore",
            deploymentTarget: .iOS(targetVersion: "13.0", devices: .iphone),
            infoPlist: .default,
            sources: [
                "Sources/**",
            ],
            resources: [
                "Resources/**",
            ],
            settings: .settings(
                configurations: [
                    .debug(
                        name: "Debug",
                        xcconfig: "Configuration/PGPMessageCore.xcconfig"
                    ),
                    .release(
                        name: "Release",
                        xcconfig: "Configuration/PGPMessageCore.xcconfig"
                    ),
                ]
            )
        ),
        Target(
            name: "PGPMessageCoreTests",
            platform: .iOS,
            product: .unitTests,
            bundleId: "ru.lashmanov.PGPMessageCoreTests",
            infoPlist: .default,
            sources: ["Tests/**"],
            dependencies: [
                .target(name: "PGPMessageCore"),
            ]
        )
    ]
)
