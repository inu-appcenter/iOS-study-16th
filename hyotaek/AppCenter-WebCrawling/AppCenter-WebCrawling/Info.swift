import Foundation

// 크롤링 할 글을 저장할 기본 구조
// 비교적 간단한 데이터 값을 캡슐화하기 위해 class 대신 struct 사용
struct Info {
    var title: String
    var link: String
    var preview: String
}
