//
//  GetNewsListAPI.swift
//  News
//
//  Created by 이병찬 on 2019/10/05.
//  Copyright © 2019 이병찬. All rights reserved.
//

import Foundation
import Moya

struct GetNewsListAPI: TargetType {
    let keyword: String
    
    var baseURL: URL {
        return URL(string: "https://openapi.naver.com/v1/search/blog")!
    }
    
    var path: String {
        return ""
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestParameters(parameters: ["query": keyword], encoding: URLEncoding.default)
    }
    
    var headers: [String : String]? {
        return [
            "X-Naver-Client-Id": "jjCnzfeQdH4Y06GfRF1n",
            "X-Naver-Client-Secret": "7OLfXPfSg6"
        ]
    }
}
