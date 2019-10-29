//
//  RealmNews.swift
//  News
//
//  Created by 이병찬 on 2019/10/05.
//  Copyright © 2019 이병찬. All rights reserved.
//

import Foundation
import RealmSwift

class RealmNews: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var descriptionText: String = ""
    @objc dynamic var url: String = ""
    
    override static func primaryKey() -> String? {
        return "url"
    }
}

extension RealmNews {
    var asNews: News {
        return News(title: title, description: descriptionText, url: url)
    }
    
    func apply(_ entity: News) {
        self.title = entity.title
        self.descriptionText = entity.description
        self.url = entity.url
    }
}
