//
//  MovieCollectionViewCell.swift
//  Desafio_Popcode
//
//  Created by Rita Lisboa on 02/05/22.
//

import UIKit
import AlamofireImage

class MovieCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        clipsToBounds = true
        layer.cornerRadius = 8
    }
    
    let movieImg: UIButton = {
        let movieImg = UIButton()
        movieImg.setImage(UIImage(named: "splash"), for: .normal)
        movieImg.contentMode = .scaleAspectFill
        movieImg.addTarget(self, action: #selector(detailsPage), for: .touchUpInside)
        movieImg.tag = 1
        movieImg.translatesAutoresizingMaskIntoConstraints = false
        return movieImg
    }()
    
    func constraintsMovieImg() {
        movieImg.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        movieImg.topAnchor.constraint(equalTo: topAnchor).isActive = true
        movieImg.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        movieImg.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40).isActive = true
    }
    
    @objc func detailsPage() {
        let favButtonAction = HomeViewController()
        favButtonAction.changeToDetailsPage()
    }
    
    let movieBackground: UIView = {
        let movieBackground = UIView()
        movieBackground.backgroundColor = UIColor(named: "secondColor")
        movieBackground.alpha = 0.3
        movieBackground.layer.cornerRadius = 8
        movieBackground.contentMode = .scaleAspectFill
        movieBackground.translatesAutoresizingMaskIntoConstraints = false
        return movieBackground
    }()
    
    func constraintsMovieBaaackground() {
        movieBackground.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        movieBackground.topAnchor.constraint(equalTo: movieImg.bottomAnchor, constant: -4).isActive = true
        movieBackground.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        movieBackground.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        movieBackground.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
    
    // MARK: - MovieTitle
    
    let movieTitle: UILabel = {
        let movieTitle = UILabel()
        movieTitle.text = "[movieName] [movieName] [movieName]"
        movieTitle.font = .boldSystemFont(ofSize: 13)
        movieTitle.textColor = UIColor.white
        movieTitle.numberOfLines = 2
        movieTitle.lineBreakMode = .byTruncatingTail
        movieTitle.translatesAutoresizingMaskIntoConstraints = false
        return movieTitle
    }()
    
    func constraintsMovieTitle() {
        movieTitle.leadingAnchor.constraint(equalTo: movieBackground.leadingAnchor, constant: 13).isActive = true
        movieTitle.trailingAnchor.constraint(equalTo: movieBackground.trailingAnchor, constant: -40).isActive = true
        movieTitle.centerYAnchor.constraint(equalTo: movieBackground.centerYAnchor).isActive = true
    }
    
    let movieFavorite: UIButton = {
        let movieFavorite = UIButton()
        movieFavorite.setImage(UIImage(systemName: "heart"), for: .normal)
        movieFavorite.setImage(UIImage(systemName: "heart.fill"), for: .selected)
        movieFavorite.tintColor = UIColor(named: "baseColor")
        movieFavorite.addTarget(self, action: #selector(favButtonAction), for: .touchUpInside)
        movieFavorite.tag = 1
        movieFavorite.translatesAutoresizingMaskIntoConstraints = false
        return movieFavorite
    }()
    
    func constraintsMovieFavorite() {
        movieFavorite.trailingAnchor.constraint(equalTo: movieBackground.trailingAnchor, constant: -10).isActive = true
        movieFavorite.centerYAnchor.constraint(equalTo: movieBackground.centerYAnchor).isActive = true
    }
    
    @objc func favButtonAction() {
        let favButtonAction = HomeViewController()
        favButtonAction.makeFavoriteMovie()
    }
    
    func setupViews() {
        addSubviews()
        constraintsMovieImg()
        constraintsMovieBaaackground()
        constraintsMovieTitle()
        constraintsMovieFavorite()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    private func addSubviews(){
        addSubview(movieImg)
        addSubview(movieBackground)
        addSubview(movieTitle)
        addSubview(movieFavorite)
    }
}
