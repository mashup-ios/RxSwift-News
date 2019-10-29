//
//  NewsCell.swift
//  News
//
//  Created by 이병찬 on 2019/10/05.
//  Copyright © 2019 이병찬. All rights reserved.
//

import UIKit
import SnapKit
import Then
import Kanna

class NewsCell: UITableViewCell {
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    
    func setData(_ news: News) {
        titleLabel.text = toString(news.title)
        descriptionLabel.text = toString(news.description)
    }
    
    func toString(_ htmlString: String) -> String {
        guard let html = try? HTML(html: htmlString, encoding: .utf8) else {
            return htmlString
        }
        return html.content ?? ""
    }
    
    func layout() {
        addSubviews(titleLabel, descriptionLabel)
        
        titleLabel.snp.makeConstraints {
            $0.top.left.right.equalToSuperview().inset(20)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
            $0.left.right.bottom.equalToSuperview().inset(20)
        }
    }
    
    func attribute() {}
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        layout()
        attribute()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
