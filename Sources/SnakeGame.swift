enum Direction {
    case up, down, left, right
}

typealias Point = (x: Int, y: Int)

class SnakeGame: Game {
    var snake: [Point] = [(x: 5, y: 5)]
    var food: Point?
    var direction: Direction = .right

    var width: Int { terminal.canvasWidth }
    var height: Int { terminal.canvasHeight }

    override func draw() {
        // Borders
        for x in 0..<width {
            terminal.draw(x: x, y: 0, symbol: "─")
            terminal.draw(x: x, y: height - 1, symbol: "─")
        }
        for y in 0..<height {
            terminal.draw(x: 0, y: y, symbol: "│")
            terminal.draw(x: width - 1, y: y, symbol: "│")
        }
        terminal.draw(x: 0, y: 0, symbol: "┌")
        terminal.draw(x: width - 1, y: 0, symbol: "┐")
        terminal.draw(x: 0, y: height - 1, symbol: "└")
        terminal.draw(x: width - 1, y: height - 1, symbol: "┘")

        // Food
        if let food {
            terminal.draw(x: food.x, y: food.y, symbol: "o")
        }

        // Snake
        for body in snake {
            terminal.draw(x: body.x, y: body.y, symbol: "#")
        }
    }

    override func loop() {
        if food == nil {
            spawnFood()
        }
        guard let food else {
            return
        }

        let head = snake.first!
        var newHead = head

        switch direction {
        case .up: newHead.y -= 1
        case .down: newHead.y += 1
        case .left: newHead.x -= 1
        case .right: newHead.x += 1
        }

        if newHead.x < 1 || newHead.x >= width - 1 || newHead.y < 1 || newHead.y >= height - 1 {
            return
        }

        if snake.contains(where: { $0 == newHead }) {
            return
        }

        snake.insert(newHead, at: 0)

        if newHead == food {
            self.food = nil
        } else {
            snake.removeLast()
        }
    }

    override func processInput(_ key: String) {
        switch key {
        case "w": if direction != .down { direction = .up }
        case "s": if direction != .up { direction = .down }
        case "a": if direction != .right { direction = .left }
        case "d": if direction != .left { direction = .right }
        case "q": isRunning = false
        default: break
        }
    }
}

extension SnakeGame {
    func spawnFood() {
        repeat {
            food = (x: Int.random(in: 2..<width - 2), y: Int.random(in: 2..<height - 2))
        } while snake.contains(where: { $0 == food! })
    }
}
