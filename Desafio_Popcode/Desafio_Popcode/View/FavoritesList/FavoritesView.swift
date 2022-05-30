//
//  FavoritesView.swift
//  Desafio_Popcode
//
//  Created by Rita Lisboa on 30/04/22.
//

import UIKit

class FavoritesView: UITableViewCell {

    static let identifier = "FavoriteView"
  
    let movieImg: UIImageView = {
        let movieImg = UIImageView()
        movieImg.image = UIImage(named: "splash")
        movieImg.contentMode = .scaleAspectFit
        movieImg.translatesAutoresizingMaskIntoConstraints = false
        return movieImg
    }()
    
    // MARK: - MovieTitle
    
    let movieTitle: UILabel = {
        let movieTitle = UILabel()
        movieTitle.text = "[movieName] [movieName] [movieName]"
        movieTitle.font = .boldSystemFont(ofSize: 22)
        movieTitle.textColor = UIColor.white
        movieTitle.numberOfLines = 3
        movieTitle.lineBreakMode = .byTruncatingTail
        movieTitle.translatesAutoresizingMaskIntoConstraints = false
        return movieTitle
    }()
    
    // MARK: - year
    
    let movieYearView: UIView = {
        let movieYearView = UIView()
        movieYearView.backgroundColor = UIColor(named: "secondColor")
        movieYearView.alpha = 0.4
        movieYearView.layer.cornerRadius = 16
        movieYearView.contentMode = .scaleAspectFill
        movieYearView.translatesAutoresizingMaskIntoConstraints = false
        return movieYearView
    }()
    
    let movieFave: UIButton = {
        let movieFave = UIButton()
        movieFave.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        movieFave.tintColor = UIColor.systemGray3
        movieFave.addTarget(self, action: #selector(favButtonAction), for: .touchUpInside)
        movieFave.tag = 1
        movieFave.translatesAutoresizingMaskIntoConstraints = false
        return movieFave
    }()
    
    var fav: FavoriteTableViewController?
    @objc func favButtonAction() {
        print("fav")
        fav?.makeFavoriteMovie()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor(named: "backgroundColor")
        contentView.addSubview(movieImg)
        contentView.addSubview(movieTitle)
        contentView.addSubview(movieFave)
        layoutSubviews()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let imgSize = contentView.frame.size.height-15
        
        movieImg.frame = CGRect(x: 10, y: 10, width: imgSize, height: imgSize)
        movieTitle.frame = CGRect(x: 10+movieImg.frame.size.width, y: 0, width: 220, height: contentView.frame.size.height)
        movieFave.frame = CGRect(x: contentView.frame.size.width-70, y: 0, width: 80, height: contentView.frame.size.height)
    }
}
