//
//  GetStoredNewsUseCase.swift
//  News
//
//  Created by 이병찬 on 2019/10/05.
//  Copyright © 2019 이병찬. All rights reserved.
//

import Foundation
import RxSwift

class GetStoredNewsUseCase {
    let newsRepository: NewsRepository
    
    init(newsRepository: NewsRepository = NewsRepositoryImpl()) {
        self.newsRepository = newsRepository
    }
    
    func excute() -> Single<[News]> {
        return newsRepository.getStoredNewsList()
    }
}
