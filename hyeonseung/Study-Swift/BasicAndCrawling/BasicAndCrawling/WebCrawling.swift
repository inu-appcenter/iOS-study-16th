//
//  WebCrawling.swift
//  BasicAndCrawling
//
//  Created by 한현승 on 4/11/24.
//

import Foundation
import SwiftSoup

class CrawlingByQuery {
    
    func crawl(query: String) {
        let myURL = URL(string: "https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=0&ie=utf8&query=\(query)")
     
        guard let url = myURL else {return}
        
        do {
            let html = try String(contentsOf: url, encoding: .utf8)
            let doc: Document = try SwiftSoup.parse(html)
            let links: Elements = try doc.select(".source_box").select("a.txt")
            let titles: Elements = try doc.select("div.total_tit").select("a.link_tit")
            let previews: Elements = try doc.select("div.total_dsc_wrap").select("a.total_dsc")
         
            let count = min(links.count, titles.count, titles.count)
        
            
            for i in 0..<count{
                let link = try links[i].text()
                let title = try titles[i].text()
                let preview = try previews[i].text()
                print("\(i+1)번째 글 ")
                print("\(link)\n")
                print("\(title)\n")
                print("\(preview)\n")
            }
            
            
        }catch Exception.Error(let type, let message) {
            print("\(message)")
        }catch { // html을 가져올 때 알수 없는 오류....
            print("unknown Error")
        }
    }
    
}
