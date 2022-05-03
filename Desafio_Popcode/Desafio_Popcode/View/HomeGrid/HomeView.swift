//
//  HomeView.swift
//  Desafio_Popcode
//
//  Created by Rita Lisboa on 28/04/22.
//

import UIKit

class HomeView: UICollectionReusableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        constraintsBackgroundImage()
        constraintsTopTitle()
        constraintsTopText()
        constraintsSearchBar()
        constraintsFilterButton()
    }
    
    //     MARK: - backgroundTop
        private lazy var backgroundImage: UIImageView = {
            let imageBack = UIImageView()
            imageBack.image = UIImage(named: "navBackground")
            imageBack.contentMode = .scaleAspectFill
            imageBack.layer.cornerRadius = 30
            imageBack.translatesAutoresizingMaskIntoConstraints = false
            return imageBack
        }()
        
        private func constraintsBackgroundImage() {
            backgroundImage.topAnchor.constraint(equalTo: topAnchor).isActive = true
            backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
            backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
            backgroundImage.heightAnchor.constraint(equalToConstant: 289).isActive = true
        }
    
    //     MARK: - filterButton
         lazy var filterButton: UIButton = {
            let filterButton = UIButton()
            filterButton.setImage(UIImage(named: "menuNavBar"), for: .normal)
             filterButton.tag = 1
            filterButton.translatesAutoresizingMaskIntoConstraints = false
            return filterButton
        }()
        
        private func constraintsFilterButton() {
            filterButton.topAnchor.constraint(equalTo: topAnchor, constant: 48).isActive = true
            filterButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22).isActive = true
            filterButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
            filterButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        }
    
    //     MARK: - topTitle
        private lazy var topTitle: UILabel = {
            let topTitle = UILabel()
            topTitle.text = "movies"
            topTitle.textAlignment = .center
            topTitle.textColor = .white
            topTitle.font = UIFont(name: "Poppins-Bold", size: 30)
            topTitle.translatesAutoresizingMaskIntoConstraints = false
            return topTitle
        }()
        
        private func constraintsTopTitle() {
            topTitle.topAnchor.constraint(equalTo: topAnchor, constant: 48).isActive = true
            topTitle.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        }
    
    //     MARK: - topText
        private lazy var topText: UILabel = {
            let topText = UILabel()
            topText.text = """
            Olá,
            Avalie um filme!
            """
            topText.textAlignment = .left
            topText.numberOfLines = 2
            topText.textColor = .white
            topText.font = UIFont(name: "Poppins-Bold", size: 30)
            topText.translatesAutoresizingMaskIntoConstraints = false
            return topText
        }()
        
        private func constraintsTopText() {
            topText.topAnchor.constraint(equalTo: topTitle.bottomAnchor, constant: 37).isActive = true
            topText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22).isActive = true
        }
    
    //     MARK: - searchBar
        private lazy var searchBar: UISearchBar = {
            let searchBar = UISearchBar()
            searchBar.placeholder = "Busque um filme"
            searchBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
            searchBar.searchTextField.backgroundColor = UIColor(named: "backgroundColor")
            searchBar.barTintColor = UIColor(named: "backgroundColor")
            searchBar.translatesAutoresizingMaskIntoConstraints = false
            return searchBar
        }()
        
        private func constraintsSearchBar() {
            searchBar.topAnchor.constraint(equalTo: topText.bottomAnchor, constant: 5).isActive = true
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 13).isActive = true
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -13).isActive = true
        }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

    private func addSubviews(){
        addSubview(backgroundImage)
        addSubview(topTitle)
        addSubview(topText)
        addSubview(searchBar)
        addSubview(filterButton)
    }

}
