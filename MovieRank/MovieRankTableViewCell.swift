//
//  MovieRankTableViewCell.swift
//  MovieRank
//
//  Created by J Oh on 6/7/24.
//

import UIKit
import SnapKit

class MovieRankTableViewCell: UITableViewCell {
    
    let rankBox = UILabel()
    let movieNameLabel = UILabel()
    let openDateLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // 버튼 동작에 이슈 없음
        contentView.addSubview(rankBox)
        contentView.addSubview(movieNameLabel)
        contentView.addSubview(openDateLabel)
        
        rankBox.snp.makeConstraints { make in
            make.leading.equalTo(contentView.safeAreaLayoutGuide).offset(20)
            make.width.equalTo(40)
            make.height.equalTo(30)
        }
        
        movieNameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(rankBox.snp.centerY)
            make.leading.equalTo(rankBox.snp.trailing).offset(20)
            make.width.equalTo(170)
            
        }
        
        openDateLabel.snp.makeConstraints { make in
            make.centerY.equalTo(rankBox.snp.centerY)
            make.trailing.equalTo(contentView.safeAreaLayoutGuide).offset(-20)
            
        }
        
        rankBox.backgroundColor = .white
        rankBox.textColor = .black
        rankBox.textAlignment = .center
        rankBox.font = .boldSystemFont(ofSize: 17)
        
        movieNameLabel.textColor = .white
        movieNameLabel.font = .boldSystemFont(ofSize: 17)
        
        openDateLabel.textColor = .white
        openDateLabel.font = .systemFont(ofSize: 13)
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

