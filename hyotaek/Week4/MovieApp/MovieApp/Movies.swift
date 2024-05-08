// Movies가 Models

import UIKit

struct Movie {
    let title: String
    let description: String
    let image: String
}

// 질문1. struct로 하는 방법도 있을까?
//struct MovieList {
//    let movieList: [Movie] = [
//        Movie(title: "베트맨", description: "베트맨이 출현하는 영화"),
//        Movie(title: "캡틴 아메리카", description: "캡틴 아메리카의 기원. 캡틴 아메리카는 어떻게 탄생하게 되었을까?"),
//        Movie(title: "아이언맨", description: "토니 스타크가 출현, 아이언맨이 탄생하게된 계기가 재미있는 영화"),
//        Movie(title: "토르", description: "아스가르드의 후계자 토르가 지구에 오게 되는 스토리"),
//        Movie(title: "헐크", description: "브루스 배너 박사의 실험을 통해 헐크가 탄생하게 되는 영화"),
//        Movie(title: "스파이더맨", description: "피터 피커 학생에서 스파이더맨이 되는 과정을 담은 스토리"),
//        Movie(title: "블랙팬서", description: "와칸다의 왕위 계승자 티찰과 블랙팬서가 되다."),
//        Movie(title: "닥터스트레인지", description: "시간 되돌릴랭"),
//        Movie(title: "가디언즈 오브 갤럭시", description: "아임 그루트"),
//    ]
//}

extension Movie {
    static var data = [
        Movie(title: "베트맨", description: "베트맨이 출현하는 영화", image: "batman"),
        Movie(title: "캡틴 아메리카", description: "캡틴 아메리카의 기원. 캡틴 아메리카는 어떻게 탄생하게 되었을까?", image: "captain"),
        Movie(title: "아이언맨", description: "토니 스타크가 출현, 아이언맨이 탄생하게된 계기가 재미있는 영화", image: "ironman"),
        Movie(title: "토르", description: "아스가르드의 후계자 토르가 지구에 오게 되는 스토리", image: "thor"),
        Movie(title: "헐크", description: "브루스 배너 박사의 실험을 통해 헐크가 탄생하게 되는 영화", image: "hulk"),
        Movie(title: "스파이더맨", description: "피터 피커 학생에서 스파이더맨이 되는 과정을 담은 스토리", image: "spiderman"),
        Movie(title: "스파이더맨2", description: "피터 피커 학생에서 스파이더맨이 되는 과정을 담은 스토리2", image: "spiderman2"),
        Movie(title: "블랙팬서", description: "와칸다의 왕위 계승자 티찰과 블랙팬서가 되다.", image: "blackpanther"),
        Movie(title: "닥터스트레인지", description: "시간 되돌릴랭", image: "doctorstrange"),
        Movie(title: "가디언즈 오브 갤럭시", description: "아임 그루트", image: "guardians")
    ]
}
