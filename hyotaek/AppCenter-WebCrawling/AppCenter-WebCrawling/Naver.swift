import Foundation
import SwiftSoup

class Naver {
    // 매개변수로 String형 변수 전달받아서 Info형 배열 반환
    func SearchNaver(_ input: String) -> [Info]{
        // 각각의 글들을 저장할 Info형 빈 배열 InfoArray 생성
        // Info { title: String, link: String, preview: String }
        var InfoArray: [Info] = []
        
        // 매개변수로 받아온 input(사용자 검색 단어)이 포함된 url 저장
        let url = URL(string: "https://search.naver.com/search.naver?display=15&f=&filetype=0&page=2&query=" + input + "&research_url=&sm=tab_pge&start=1&where=web")
        // url 옵셔널 바인딩
        guard let url else { return [Info(title: "", link: "", preview: "")] }
        
        // 에러 발생할 경우를 대비한 try catch문
        do {
            // url에서 HTML 내용을 가져와 문자열로 변환 (에러 발생 시 catch 블록으로 넘어감)
            let html = try String(contentsOf: url, encoding: .utf8)
            // SwiftSoup 라이브러리를 사용하여 HTML 문자열을 Document 객체로 변환 (에러 발생 시 catch 블록으로 넘어감)
            let document: Document = try SwiftSoup.parse(html)
            
            // 각각을 document에서 select로 클래스를 찾아 Elements 객체로 저장
            let titles: Elements = try document.select("div.total_tit").select("a.link_tit")
            let links: Elements = try document.select("div.source_box").select("a.txt")
            let previews: Elements = try document.select("div.total_dsc_wrap")
            
            // title, link, preview 중 누락된 정보가 있을 수 있으므로 셋 중 가장 적은 숫자로 반복 (out of index 피하기 위해)
            for index in 0..<min(titles.count, links.count, previews.count) {
                // InfoArray[[글1title, 글1link, 글1preview], [글2title, 글2link, 글2preview], ....]
                // 위와 같은 형식으로 저장하기 위해 Info 인스턴스 생성 후 information 상수에 할당
                // titles 객체에 크롤링한 여러 글들이 담겨 있으므로 titles[index]로 사용 가능
                let information: Info = Info(title: try titles[index].text(), link: try links[index].text(), preview: try previews[index].text())
                // information을 InfoArray에 추가
                InfoArray.append(information)
            }
            // InfoArray 반환
            return InfoArray
            //Exception.Error 타입의 에러 발생 시 실행
        } catch Exception.Error(type: let type, Message: let message) {
            print("타입 : \(type)")
            print("메시지 : \(message)")
            return [Info(title: "", link: "", preview: "")]
            // Exception.Error 타입 에러 이외의 모든 에러 처리
        } catch{
            print("예외")
            return [Info(title: "", link: "", preview: "")]
        }
    }
}
