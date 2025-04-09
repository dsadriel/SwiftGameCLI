import Foundation
import os

public class Game {
    lazy var terminal = Terminal()
    var isRunning = true
    var updateInterval = 100 // in ms

    public func start() {
        DispatchQueue.global(qos: .userInteractive).async { [weak self] in
            while let self, self.isRunning {
                if let key = Terminal.getKeyPress() {
                    self.processInput(key)
                }
            }
        }

        // Execute the loop
        while isRunning {
            terminal.update()  // Update terminal canvas
            loop()  // Update game state
            draw()  // Update canvas
            terminal.render()  // Render canvas
            usleep(updateInterval*1000) 
        }
    }

    // Process any inputs from user
    func processInput(_ key: String) {}

    // Update the game state
    func loop() {}

    // Update the canvas
    func draw() {}
}