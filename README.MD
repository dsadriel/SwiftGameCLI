# 🎮 SwiftGameCLI

A lightweight terminal game engine written in Swift. This package provides a simple API for handling real-time key input, terminal rendering, and game loops—all using raw terminal access with ANSI escape sequences.

Ideal for developers looking to create command-line games or interactive terminal-based applications in Swift.

> 🧬 **Forked from [`rational-kunal/SSSnake`](https://github.com/rational-kunal/SSSnake)**  
> Originally inspired by his excellent [blog post](https://dev.to/rationalkunal/building-a-snake-game-on-terminal-with-swift-57a2) on building a terminal-based snake game with Swift.

---

## ✨ Features

- Smooth, flicker-free terminal rendering with alternate screen buffer
- Non-blocking keyboard input
- Extendable game loop architecture (`start()`, `loop()`, `draw()`, `processInput`)
- Swift Package Manager support

---

## 📦 Installation

### 📌 Using Swift Package Manager

You can add **SwiftGameCLI** to your project by declaring it in your `Package.swift` file:

```swift
// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "YourProject",
    platforms: [.macOS(.v11)],
    dependencies: [
        .package(url: "https://github.com/dsadriel/SwiftGameCLI.git", branch: "main")
    ],
    targets: [
        .target(
            name: "YourProject",
            dependencies: ["SwiftGameCLI"]
        )
    ]
)
```

Then, in your Swift source files:

```swift
import SwiftGameCLI
```
