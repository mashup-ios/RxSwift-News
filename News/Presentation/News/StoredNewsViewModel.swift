//
//  StoredNewsViewModel.swift
//  News
//
//  Created by 이병찬 on 2019/10/05.
//  Copyright © 2019 이병찬. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class StoredNewsViewModel: NewsViewBindable {
    let viewDidLoad = PublishRelay<Void>()
    let newsList: Driver<[News]>
    let newsSelected = PublishRelay<News>()
    
    init(getNews: GetStoredNewsUseCase = GetStoredNewsUseCase()) {
        self.newsList = viewDidLoad
            .flatMapLatest(getNews.excute)
            .asDriver(onErrorDriveWith: .empty())
    }
}
