import Foundation

class SearchNaverByInput {
    // Naver 클래스의 인스턴스 생성 후, search 상수에 할당
    let search: Naver = Naver()
    
    func InfiniteLoop() {
        // 무한 루프
        while(true) {
            print("검색 단어 : ", terminator: "")
            // 사용자에게 입력 받은 input 상수 옵셔널 바인딩
            guard let input = readLine() else { return }
            
            // input이 "end"라면
            if input == "end" {
                print("Program is ended")
                // 프로그램 종료
                return
            }
            // input이 "end"가 아닌 단어라면
            else {
                // Info형 배열 result를 선언 후, 사전 생성된 search 인스턴스의 SearchNaver() 메서드 사용 (매개변수는 input)
                let result: [Info] = search.SearchNaver(input)
                // 같은 클래스인 SearchNaverByInput 내부 메서드인 printResult()를 사용하기 위해 self.printResult() 사용.
                self.printResult(result)
            }
        }
    }
    // InfoArray[[글1title, 글1link, 글1preview], [글2title, 글2link, 글2preview], ....]
    // 위와 같은 구조의 result 매개변수로 받음
    func printResult(_ result: [Info]) {
        // 아래와 같이 코딩도 가능
//        for index in 0..<result.count {
//            print("\(index + 1)번째")
//            print("title : \(result[index].title)")
//            print("link : \(result[index].link)")
//            print("preview : \(result[index].preview)")
//        }
        
        // index 없이 출력할수도 있지만 가독성을 위해 index 추가
        for (index, value) in result.enumerated() {
            print("\n")
            print("\(index + 1)번째")
            print("title : \(value.title)")
            print("link : \(value.link)")
            print("preview : \(value.preview)")
            print("===============================================================================================")
        }
    }
}
