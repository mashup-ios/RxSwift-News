//
//  News.swift
//  News
//
//  Created by 이병찬 on 2019/10/05.
//  Copyright © 2019 이병찬. All rights reserved.
//

import Foundation

struct News: Equatable {
    let title: String
    let description: String
    let url: String
    
    static func == (lhs: News, rhs: News) -> Bool {
        return lhs.url == rhs.url
    }
}

extension News: Codable {
    enum CodingKeys: String, CodingKey {
        case title, description
        case url = "link"
    }
}
