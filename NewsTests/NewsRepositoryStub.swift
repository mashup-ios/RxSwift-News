//
//  NewsRepositoryStub.swift
//  NewsTests
//
//  Created by 이병찬 on 2019/10/13.
//  Copyright © 2019 이병찬. All rights reserved.
//

import Foundation
import Stubber
import RxSwift
import RxBlocking

@testable import News

class NewsRepositoryStub: NewsRepository {
    func getNewsList() -> Single<[News]> {
        Stubber.invoke(getNewsList, args: Void())
    }
    
    func storeNewsList(newsList: [News]) -> Single<Void> {
        Stubber.invoke(storeNewsList, args: newsList)
    }
    
    func getStoredNewsList() -> Single<[News]> {
        fatalError()
    }
}
