let game = BaseballGame()
game.start()

class BaseballGame {
    func start() {
        let answer = makeAnswer()
    }
    
    func makeAnswer() -> [Int] {
        var numbers = [Int](1...9)
        var gameAnswer = [Int]()
        
            for _ in 0..<3 {
                let index = Int.random(in: 0..<numbers.count)
                gameAnswer.append(numbers[index])
                numbers.remove(at: index)
            }

            return gameAnswer
        }
}
