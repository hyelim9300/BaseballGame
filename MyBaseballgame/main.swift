import Foundation

class BaseballGame {
    var answer = [Int]()
    
    func start() {
        playGame()
    }
    
    func makeAnswer() -> [Int] {
        var numbers = Array(0...9)               // 0...9까지 숫자 배열
        var gameAnswer = [Int]()                 // 정답 값
        
        for _ in 0..<3 {                               // 3번 반복
            let index = Int.random(in: 0...9)          // 0...9까지 인덱스 값
            gameAnswer.append(numbers[index])          // 정답 값에 인덱스 값 추가
            numbers.remove(at: index)                  // 넘버스에서 인덱스 값 제거
        }
        
        return gameAnswer                              // 정답 값 반환
        
//        ::성용 튜터님 피드백::
//        var gameAnswer = [Int]()                     >> Int 타입 배열 정답 값 선언
//        while gameAnswer.count < 3 {                 >> while 문으로 gameAnswer 이 3 전까지 수 순서? = (0, 1, 2) >> 즉 3개
//            let number =  Int.random(in: 0...9)      >> Int 타입 넘버 값 선언, 0...9 에서 랜덤
//            if !gameAnswer.contains(number) {        >> If 문 만약 정답 값 배열에 겹치는 수가 있을 경우 다시 넘버중에 랜덤 추가 없는 경우 추가 를 계속 반복해 배열의 수가 3개가 될때까지 하다가 멈추고 3개가 되면 값을 리턴하는 거구나~~~ 대박 너무 좋다.어케 이런 생각을 햇지 ㄷㄷ
//                gameAnswer.append(number)            >>
//            }
//            return gameAnswer
//        }
    }
    // MARK: --- lv. 1
    func playGame() {
        print("3자리 숫자를 맞춰주세요.")                    // 게임 시작 안내
        answer = makeAnswer()                          // 정답 값 생성
        
        while true {
            guard let userInput = readLine()             // 유저 인풋 값 입력
                    , userInput.count == 3 else {
                print("3자리 숫자로만 다시 입력해주세요.")
                continue                                 // 잘못된 입력한 경우 에러, 반복
            }
            
            var userNumbers = [Int]()                   // 유저 넘버 선언
            for i in userInput {
                if let number = Int(String(i)) {        // 값이 숫자인지 확인
                    userNumbers.append(number)
                } else {
                    print("숫자로만 입력해주세요.")           // 숫자가 아닌 경우 에러, 반복
                    continue
                }
            }
            
            var strike = 0
            var ball = 0                                // 스트라이크, 볼 값 초기화
            
            for (index, value) in userNumbers.enumerated() {
                if answer.contains(value) {
                    if answer[index] == value {
                        strike += 1                   // 위치, 값 일치 시 스트라이크 += 1
                    } else {
                        ball += 1                     // 값만 일치 시 볼 += 1
                    }
                }
            }
            
            print("\(strike) 스트라이크, \(ball) 볼")    // 스트라이크, 볼 값 출력
            
            if userNumbers == answer {               // 정답 확인
                print("정답입니다!")
                break                                // 정답 확인 후 반복 종료
            }
            
        }
        
    }
}
// MARK: --- lv.2
var game = BaseballGame()
game.start()
