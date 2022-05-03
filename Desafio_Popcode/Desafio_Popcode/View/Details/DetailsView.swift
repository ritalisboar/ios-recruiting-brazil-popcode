//
//  DetailsView.swift
//  Desafio_Popcode
//
//  Created by Rita Lisboa on 30/04/22.
//

import UIKit

class DetailsView: UIView {

    //     MARK: - backgroundTop
        private lazy var backgroundMovie: UIImageView = {
            let backgroundMovie = UIImageView()
            backgroundMovie.image = UIImage(named: "navBackground")
            backgroundMovie.contentMode = .scaleAspectFill
            backgroundMovie.translatesAutoresizingMaskIntoConstraints = false
            return backgroundMovie
        }()
        
        private func constraintsBackgroundMovie() {
            backgroundMovie.topAnchor.constraint(equalTo: topAnchor).isActive = true
            backgroundMovie.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
            backgroundMovie.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
            backgroundMovie.heightAnchor.constraint(equalToConstant: 358).isActive = true
        }
    
    
    //     MARK: - backgroundBody
        private lazy var backgroundBody: UIView = {
            let backgroundBody = UIView()
            backgroundBody.backgroundColor = UIColor(named: "backgroundColor")
            backgroundBody.contentMode = .scaleAspectFill
            backgroundBody.translatesAutoresizingMaskIntoConstraints = false
            return backgroundBody
        }()
        
        private func constraintsBackgroundBody() {
            backgroundBody.topAnchor.constraint(equalTo: backgroundMovie.bottomAnchor).isActive = true
            backgroundBody.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
            backgroundBody.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
            backgroundBody.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        }
    
    
    //     MARK: - topTitle
        private lazy var movieTitle: UILabel = {
            let movieTitle = UILabel()
            movieTitle.text = "movies title movies title movies title movies title"
            movieTitle.textAlignment = .left
            movieTitle.numberOfLines = 3
            movieTitle.textColor = .white
            movieTitle.font = UIFont(name: "Poppins-Bold", size: 25)
            movieTitle.translatesAutoresizingMaskIntoConstraints = false
            return movieTitle
        }()
        
        private func constraintsMovieTitle() {
            movieTitle.topAnchor.constraint(equalTo: backgroundBody.topAnchor, constant: 31).isActive = true
            movieTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 31).isActive = true
            movieTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -55).isActive = true
        }
    
    
    //     MARK: - backgroundTop
        private lazy var favoriteButton: UIImageView = {
            let favoriteButton = UIImageView()
            favoriteButton.image = UIImage(systemName: "heart")
            favoriteButton.tintColor = UIColor(named: "baseColor")
            favoriteButton.contentMode = .scaleAspectFill
            favoriteButton.translatesAutoresizingMaskIntoConstraints = false
            return favoriteButton
        }()
        
        private func constraintsFavoriteButton() {
            favoriteButton.topAnchor.constraint(equalTo: backgroundBody.topAnchor, constant: 35).isActive = true
            favoriteButton.leadingAnchor.constraint(equalTo: movieTitle.trailingAnchor).isActive = true
            favoriteButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
            favoriteButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        }
    
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
    
    func constraintsMovieYearView() {
        movieYearView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
        movieYearView.topAnchor.constraint(equalTo: movieTitle.bottomAnchor, constant: 20).isActive = true
        movieYearView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        movieYearView.widthAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    
    let movieYear: UILabel = {
        let movieYear = UILabel()
        movieYear.text = "2000"
        movieYear.font = .boldSystemFont(ofSize: 15)
        movieYear.textColor = UIColor.white
        movieYear.lineBreakMode = .byTruncatingTail
        movieYear.translatesAutoresizingMaskIntoConstraints = false
        return movieYear
    }()
    
    func constraintsMovieYear() {
        movieYear.centerXAnchor.constraint(equalTo: movieYearView.centerXAnchor).isActive = true
        movieYear.centerYAnchor.constraint(equalTo: movieYearView.centerYAnchor).isActive = true
    }
    
    // MARK: - gênero
    
    let generoView: UIView = {
        let generoView = UIView()
        generoView.backgroundColor = UIColor(named: "secondColor")
        generoView.alpha = 0.4
        generoView.layer.cornerRadius = 16
        generoView.contentMode = .scaleAspectFill
        generoView.translatesAutoresizingMaskIntoConstraints = false
        return generoView
    }()
    
    func constraintsGeneroView() {
        generoView.leadingAnchor.constraint(equalTo: movieYearView.trailingAnchor, constant: 15).isActive = true
        generoView.topAnchor.constraint(equalTo: movieTitle.bottomAnchor, constant: 20).isActive = true
        generoView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        generoView.widthAnchor.constraint(equalToConstant: 120).isActive = true
    }
    
    let genero: UILabel = {
        let genero = UILabel()
        genero.text = "[Aventura]"
        genero.font = .boldSystemFont(ofSize: 15)
        genero.textColor = UIColor.white
        genero.lineBreakMode = .byTruncatingTail
        genero.translatesAutoresizingMaskIntoConstraints = false
        return genero
    }()
    
    func constraintsGenero() {
        genero.centerXAnchor.constraint(equalTo: generoView.centerXAnchor).isActive = true
        genero.centerYAnchor.constraint(equalTo: generoView.centerYAnchor).isActive = true
    }
    
    // MARK: - movie description
    
    
    let movieDescription: UILabel = {
        let movieDescription = UILabel()
        movieDescription.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eleifend tempor at egestas diam malesuada donec donec. Vestibulum sed euismod purus magna lectus viverra nunc turpis vitae. Morbi nunc ornare pulvinar placerat. Faucibus eget laoreet morbi euismod egestas tempor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eleifend tempor at egestas diam malesuada donec donec. Vestibulum sed euismod purus magna lectus viverra nunc turpis vitae. Morbi nunc ornare pulvinar placerat. Faucibus eget laoreet morbi euismod egestas tempor."
        movieDescription.font = .boldSystemFont(ofSize: 15)
        movieDescription.textColor = UIColor.white
        movieDescription.numberOfLines = 30
        movieDescription.lineBreakMode = .byTruncatingTail
        movieDescription.textAlignment = .left
        movieDescription.translatesAutoresizingMaskIntoConstraints = false
        return movieDescription
    }()
    
    func constraintsMovieDescription() {
        movieDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
        movieDescription.topAnchor.constraint(equalTo: movieYearView.bottomAnchor, constant: 20).isActive = true
        movieDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -31).isActive = true
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        constraintsBackgroundMovie()
        constraintsBackgroundBody()
        constraintsMovieTitle()
        constraintsFavoriteButton()
        constraintsMovieYearView()
        constraintsMovieYear()
        constraintsGeneroView()
        constraintsGenero()
        constraintsMovieDescription()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

    private func addSubviews(){
        addSubview(backgroundMovie)
        addSubview(backgroundBody)
        addSubview(movieTitle)
        addSubview(favoriteButton)
        addSubview(movieYearView)
        addSubview(movieYear)
        addSubview(generoView)
        addSubview(genero)
        addSubview(movieDescription)
    }

}
