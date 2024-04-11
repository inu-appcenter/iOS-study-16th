//
//  Search.swift
//  BasicAndCrawling
//
//  Created by 한현승 on 4/11/24.
//

import Foundation

// 단어를 검색할 클래스
class InputQuery {
    
    let webcrawling: CrawlingByQuery = CrawlingByQuery()
    
    // 검색어를 CrawlingByQuery클래스의 crawl()메서드의 프로퍼티로 넘긴다.
    func inputQuery() {
        
        
        
        while(true){
            let search: String? = readLine()
            
            guard let keyword = search else {return}
            
            if keyword == "0" || keyword == "quit" {
                print("프로그램을 종료합니다.")
                return
            }else {
                webcrawling.crawl(query: keyword)
            }
        }
    }
    
    
    
    
}

