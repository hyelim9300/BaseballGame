import Foundation

class BaseballGame {
    private var answer = [Int]()
    
    func start() {
        answer = makeAnswer()
        playGame()
        
        func makeAnswer() -> [Int] {
            var numbers = [Int](1...9)     // 1부터 9까지 Int값 선언
            var gameAnswer = [Int]()     // 게임 정답값 선언
            
            for _ in 0..<3 {     // n으로 인덱스값 설정 후 3가지까지 제한
                let index = Int.random(in: 0...9)     // 랜덤 인덱스값
                gameAnswer.append(numbers[index])     // 인덱스값 추가
                numbers.remove(at: index)     // numbers 에서 인덱스에 있는 값 제외
            }
            
            return gameAnswer
        }
        
    }
    func playGame() {
        print("3자리 숫자를 맞춰주세요.")    // 게임 안내문
        
        while true {
            guard let input = readLine(),   // input 입력
                  input.count == 3 else {
                print("3자리 숫자로만 다시 입력해주세요.")
                continue // 잘못된 입력 시 에러, 반복
            }
            let userInput = [Int]()
            
            if userInput == answer {   // 정답 확인
                print("정답입니다!")
                break // 정답 확인 후 반복 종료
            }
            
        }
    }
}

var game = BaseballGame()
game.start()

