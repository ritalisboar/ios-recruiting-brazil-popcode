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
        movieImg.setImage(UIImage(systemName: "hourglass.bottomhalf.filled"), for: .normal)
        movieImg.tintColor = UIColor(named: "baseColor")
        movieImg.contentMode = .scaleAspectFit
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
        movieTitle.text = "Loading..."
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
    
    func setupViews() {
        addSubviews()
        constraintsMovieImg()
        constraintsMovieBaaackground()
        constraintsMovieTitle()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    private func addSubviews(){
        addSubview(movieImg)
        addSubview(movieBackground)
        addSubview(movieTitle)
    }
}
