import ProjectDescription

// MARK: - Project

let project = Project(
    name: "PGPMessageDesignSystem",
    targets: [
        Target(
            name: "PGPMessageDesignSystem",
            platform: .iOS,
            product: .framework,
            bundleId: "ru.lashmanov.PGPMessageDesignSystem",
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
                        xcconfig: "Configuration/PGPMessageDesignSystem.xcconfig"
                    ),
                    .release(
                        name: "Release",
                        xcconfig: "Configuration/PGPMessageDesignSystem.xcconfig"
                    ),
                ]
            )
        ),
    ]
)
