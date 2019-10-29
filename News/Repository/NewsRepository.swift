//
//  NewsRepository.swift
//  News
//
//  Created by 이병찬 on 2019/10/05.
//  Copyright © 2019 이병찬. All rights reserved.
//

import Foundation
import RxSwift

protocol NewsRepository {
    func getNewsList() -> Single<[News]>
    func storeNewsList(newsList: [News]) -> Single<Void>
    func getStoredNewsList() -> Single<[News]>
}
