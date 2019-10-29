//
//  NewsRepositoryImpl.swift
//  News
//
//  Created by 이병찬 on 2019/10/05.
//  Copyright © 2019 이병찬. All rights reserved.
//

import Foundation
import RxSwift
import Moya
import RealmSwift
import Then

class NewsRepositoryImpl: NewsRepository {
    let provider = MoyaProvider<GetNewsListAPI>()
    
    func getNewsList() -> Single<[News]> {
        return provider.rx
            .request(
                GetNewsListAPI(keyword: "한국")
            )
            .do(onSuccess: { value in
                
            })
            .map([News].self, atKeyPath: "items")
    }
    
    func storeNewsList(newsList: [News]) -> Single<Void> {
        return Single.deferred {
            let realm = try Realm()
            
            let realmObjects = newsList.map { news in
                RealmNews().then { $0.apply(news) }
            }
            
            try realm.write {
                realm.deleteAll()
                realm.add(realmObjects)
            }
            
            return .just(Void())
        }
    }
    
    func getStoredNewsList() -> Single<[News]> {
        return Single.deferred {
            let realm = try Realm()
            
            let newsList = Array(realm.objects(RealmNews.self)).map { $0.asNews }
            
            return .just(newsList)
        }
    }
}
