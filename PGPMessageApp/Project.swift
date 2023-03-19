import ProjectDescription

// MARK: - Project

let infoPlist: [String: InfoPlist.Value] = [
    "UILaunchStoryboardName": .string("LaunchScreen.storyboard"),
    "UIApplicationSceneManifest": .dictionary([
        "UIApplicationSupportsMultipleScenes": .boolean(false),
        "UISceneConfigurations": .dictionary([:])
    ])
]

let project = Project(
    name: "PGPMessageApp",
    targets: [
        Target(
            name: "PGPMessageApp",
            platform: .iOS,
            product: .app,
            bundleId: "ru.lashmanov.PGPMessage",
            deploymentTarget: .iOS(targetVersion: "13.0", devices: .iphone),
            infoPlist: .extendingDefault(with: infoPlist),
            sources: [
                "Sources/**"
            ],
            resources: [
                "Resources/**"
            ],
            settings: .settings(
                configurations: [
                    .debug(
                        name: "Debug",
                        xcconfig: "Configuration/PGPMessageApp.xcconfig"
                    ),
                    .release(
                        name: "Release",
                        xcconfig: "Configuration/PGPMessageApp.xcconfig"
                    ),
                ]
            )
        ),
        Target(
            name: "PGPMessageAppTests",
            platform: .iOS,
            product: .unitTests,
            bundleId: "ru.lashmanov.PGPMessageAppTests",
            infoPlist: .default,
            sources: ["Tests/**"],
            dependencies: [
                .target(name: "PGPMessageApp"),
            ]
        )
    ]
)
