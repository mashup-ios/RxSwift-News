//
//  NewsDummyData.swift
//  NewsTests
//
//  Created by 이병찬 on 2019/10/13.
//  Copyright © 2019 이병찬. All rights reserved.
//

import Foundation

@testable import News

class NewsDummyData {
    static let shared = NewsDummyData()
    private init() {}
    
    let news1 = News(title: "뉴스1", description: "뉴스본문1", url: "https://news1")
    let news2 = News(title: "뉴스2", description: "뉴스본문2", url: "https://news2")
    let news3 = News(title: "뉴스3", description: "뉴스본문3", url: "https://news3")
    let news4 = News(title: "뉴스4", description: "뉴스본문4", url: "https://news4")
    let news5 = News(title: "뉴스5", description: "뉴스본문5", url: "https://news5")
    let news6 = News(title: "뉴스6", description: "뉴스본문6", url: "https://news6")
    let news7 = News(title: "뉴스7", description: "뉴스본문7", url: "https://news7")
    let news8 = News(title: "뉴스8", description: "뉴스본문8", url: "https://news8")
    let news9 = News(title: "뉴스9", description: "뉴스본문9", url: "https://news9")
    let news10 = News(title: "뉴스10", description: "뉴스본문10", url: "https://news10")
}
