//
//  NewsViewModelTest.swift
//  NewsTests
//
//  Created by 이병찬 on 2019/10/13.
//  Copyright © 2019 이병찬. All rights reserved.
//

import Foundation
import XCTest
import Nimble
import Stubber
import RxSwift
import RxCocoa
import RxTest

@testable import News

class NewsViewModelTest: XCTestCase {
    let dummy = NewsDummyData.shared
    let stubRepository = NewsRepositoryStub()
    var useCase: GetNewsUseCase!
    var viewModel: NewsViewModel!
    
    var scheduler: TestScheduler!
    var disposeBag: DisposeBag!
    
    override func setUp() {
        self.useCase = GetNewsUseCase(newsRepository: stubRepository)
        self.viewModel = NewsViewModel(getNews: useCase)
        
        self.scheduler = TestScheduler(initialClock: 0)
        self.disposeBag = DisposeBag()
    }
    
    func testGettingNewsListWhenViewDidLoad() {
        let dummyNewsList = [dummy.news1, dummy.news2]
        
        Stubber.register(stubRepository.getNewsList, with: { _ in
            return .just(dummyNewsList)
        })
        
        Stubber.register(stubRepository.storeNewsList, with: { _ in
            return .just(Void())
        })
        
        let viewDidLoad = scheduler.createHotObservable([
            .next(1, Void())
        ])
        viewDidLoad.bind(to: viewModel.viewDidLoad).disposed(by: disposeBag)
        
        let newsListObserver = scheduler.createObserver([News].self)
        viewModel.newsList.drive(newsListObserver).disposed(by: disposeBag)
        
        scheduler.start()
        
        expect(newsListObserver.events).to(equal([.next(1, dummyNewsList)]))
    }
    
    
    
    
    
    
    
}
