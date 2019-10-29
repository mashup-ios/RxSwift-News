//
//  GetNewsUseCase.swift
//  News
//
//  Created by 이병찬 on 2019/10/05.
//  Copyright © 2019 이병찬. All rights reserved.
//

import Foundation
import RxSwift

class GetNewsUseCase {
    let newsRepository: NewsRepository
    
    init(newsRepository: NewsRepository = NewsRepositoryImpl()) {
        self.newsRepository = newsRepository
    }
    
    func excute() -> Single<[News]> {
        return newsRepository.getNewsList()
            .flatMap { newsList in
                self.newsRepository
                    .storeNewsList(newsList: newsList)
                    .map { _ in newsList }
            }
            .catchErrorJustReturn([])
    }
}



