//
//  Movie.swift
//  MoviceChart
//
//  Created by 한현승 on 5/7/24.
//

import UIKit

struct Movie{
    let imageName: String
    let title: String
    let content: String
    
    var movieImage: UIImage? {
        return UIImage(named: imageName)
    }
}

extension Movie{
    static var data: [Movie] = [
        Movie(imageName: "batman",
              title: "배트맨",
              content:"고담 시의 어둠의 기사, 배트맨이 범죄와 부패에 맞서 싸우는 영화"),
        
        Movie(imageName: "captain",
              title: "캡틴 아메리카",
              content:"캡틴아메리카의 기원. 캡틴아메리카는 어떻게 탄생하게 되었을까?"),
        
        Movie(imageName: "ironman",
              title: "아이언맨",
              content:"토니 스타크가 출현, 아이언맨이 탄생하게된 계기가 재밌는 영화"),
        
        Movie(imageName: "thor",
              title: "토르",
              content:"아스가르드의 후계자 토르가 지구에 오게되는 스토리"),
        
        Movie(imageName: "blackpanther",
              title: "블랙팬서",
              content:"와칸다의 왕위 계승자 티찰과 블랙펜서가 되다."),
    
        Movie(imageName: "doctorstrange",
              title: "닥터 스트레인지",
              content:"전직 신경외과 의사가 마법을 통해 시공간을 넘나드는 우주의 수호자가 된 영화"),
        
        Movie(imageName: "guardians",
              title: "갤럭시 가디언즈",
              content:"다양한 종족의 우주 용병들이 모여 우주의 평화를 지키는 영화"),
        
        Movie(imageName: "hulk",
              title: "헐크",
              content:"브루스 배너 박사의 실험을 통해 헐크가 탄생하게 되는 영화"),
        
        Movie(imageName: "spiderman",
              title: "스파이더맨",
              content:"피터파커 학생에서 스파이더맨이 되는 과정을 다음 스토리"),
        
        Movie(imageName: "spiderman2",
              title: "스파이더맨2",
              content:"피터파커가 스파이더맨으로서의 삶과 개인적 갈등 속에서 새로운 적 닥터 옥토퍼스와 맞선다."),
    
      
    ]
}
