//
//  ViewController.swift
//  MovieRank
//
//  Created by J Oh on 6/7/24.
//

import UIKit
import Alamofire
import SnapKit

class ViewController: UIViewController {
    
    let backgroundImageView = UIImageView()
    let overlayView = UIView()
    
    let dateLabel = UILabel()
    let searchButton = UIButton()
    let tableView = UITableView()
    
    var movieList: [Movie] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 50
        
        configHierarchy()
        configLayout()
        configUI()
        
        fetchMovies()
    }
    
    
    
    func configHierarchy() {
        view.addSubview(backgroundImageView)
        backgroundImageView.addSubview(overlayView)
        view.addSubview(dateLabel)
        view.addSubview(searchButton)
        view.addSubview(tableView)
    }
    
    func configLayout() {
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        overlayView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.width.equalTo(250)
            make.height.equalTo(50)
        }
        
        searchButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.leading.equalTo(dateLabel.snp.trailing).offset(20)
            make.width.equalTo(70)
            make.height.equalTo(50)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(20)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
    }
    
    func configUI() {
        tableView.register(MovieRankTableViewCell.self, forCellReuseIdentifier: MovieRankTableViewCell.id)
        
        backgroundImageView.image = .해운대
        backgroundImageView.contentMode = .scaleAspectFill
        
        dateLabel.textColor = .white
        dateLabel.font = .systemFont(ofSize: 20)
        
        overlayView.backgroundColor = .black.withAlphaComponent(0.8)
        
        tableView.backgroundColor = .clear
        
    }
    
    func configButton() {
        searchButton.setTitle("검색", for: .normal)
        searchButton.backgroundColor = .white
        searchButton.setTitleColor(.black, for: .normal)
    }
    
    func fetchMovies() {
        let url = APIUrl.movieUrl + Date.yesterday.stringFormat
        AF.request(url).responseDecodable(of: KobisResponse.self) { response in
            switch response.result {
            case .success(let value):
                print(value.boxOfficeResult.dailyBoxOfficeList)
                self.movieList = value.boxOfficeResult.dailyBoxOfficeList
                self.dateLabel.text = Date.yesterday.stringFormat
                self.configButton()
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = movieList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieRankTableViewCell.id, for: indexPath) as! MovieRankTableViewCell
        cell.backgroundColor = .clear
        cell.rankBox.text = movie.rank
        cell.movieNameLabel.text = movie.movieNm
        cell.openDateLabel.text = movie.openDt
        return cell
    }
    
    
    
}
