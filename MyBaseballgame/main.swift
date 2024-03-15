import Foundation

class BaseballGame {
    var answer = [Int]()
    
    func start() {
        playGame()
    }
    
    func makeAnswer() -> [Int] {
        var numbers = Array(1...9)              // 1부터 9까지의 숫자 배열
        var gameAnswer = [Int]()                // 게임 정답값을 담을 배열
        
        for _ in 0..<3 { // 3번 반복해서 정답값 생성
            let index = Int.random(in: 0...9)          // 0부터 numbers 배열 크기-1 사이의 랜덤 인덱스 선택
            gameAnswer.append(numbers[index])          // 랜덤 인덱스에 해당하는 숫자를 정답 배열에 추가
            numbers.remove(at: index)                  // 정답 배열에 추가한 숫자를 numbers 배열에서 제거
        }
        
        return gameAnswer // 생성된 정답 배열 반환
    }
    
    func playGame() {
        print("3자리 숫자를 맞춰주세요.") // 게임 안내문
        answer = makeAnswer() // 정답 생성
        
        while true {
            guard let userInput = readLine(), userInput.count == 3 else {
                print("3자리 숫자로만 다시 입력해주세요.")
                continue // 잘못된 입력 시 에러, 반복
            }
            
            var userNumbers = [Int]()
            for char in userInput {
                if let number = Int(String(char)) {
                    userNumbers.append(number)
                } else {
                    print("숫자로만 입력해주세요.")
                    continue
                }
            }
            
            guard userNumbers.count == 3 else {
                print("3자리 숫자로만 다시 입력해주세요.")
                continue
            }
            
            var strike = 0
            var ball = 0
            
            for (index, value) in userNumbers.enumerated() {
                if answer.contains(value) {
                    if answer[index] == value {
                        strike += 1 // 값과 위치가 일치하면 스트라이크 증가
                    } else {
                        ball += 1 // 값은 일치하지만 위치가 다르면 볼 증가
                    }
                }
            }
            
            print("\(strike) 스트라이크, \(ball) 볼")
            
            if userNumbers == answer { // 정답 확인
                print("정답입니다!")
                break // 정답 확인 후 반복 종료
            }
            
        }
        
    }
}

var game = BaseballGame()
game.start()
