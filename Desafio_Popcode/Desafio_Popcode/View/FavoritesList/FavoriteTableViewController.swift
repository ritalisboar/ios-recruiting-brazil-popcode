//
//  FavoriteTableViewController.swift
//  Desafio_Popcode
//
//  Created by Rita Lisboa on 02/05/22.
//

import UIKit

class FavoriteTableViewController: UIViewController {
    
    var getMovies = MovieParamsPresenter()
    let movieCVC = FavoritesView()
    private var customView2: FavoritesView? = nil
    
    private lazy var favoriteView: UITableView = {
        let favoriteView = UITableView()
        favoriteView.register(FavoritesView.self,
                          forCellReuseIdentifier: FavoritesView.identifier)
        return favoriteView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getMovies.getMovies()
        buildView2()
        favoriteView.backgroundColor = UIColor(named: "backgroundColor")
        favoriteView.dataSource = self
        favoriteView.delegate = self
        view.addSubview(favoriteView)
    }
    
    private func buildView2() {
        view = FavoritesView()
        customView2 = view as? FavoritesView
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        favoriteView.frame = view.bounds
    }
    
}

// MARK: - extensions

extension FavoriteTableViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = favoriteView.dequeueReusableCell(withIdentifier: FavoritesView.identifier, for: indexPath) as! FavoritesView
        let title = getMovies.movies.map({ $0.title })
        let year = getMovies.movies.map({ $0.release_date })
        let imagePath = getMovies.movies.map({ $0.poster_path })
        
        func setupMovie(_ moviePath:String) {

            guard let imageUrl = URL(string: "https://image.tmdb.org/t/p/w185/\(moviePath)") else { return }

            cell.movieImg.af.setImage(withURL: imageUrl)
        }
        
        if title.count > 0 {
            cell.movieTitle.text = title[indexPath.row]
            cell.movieYear.text = String(year[indexPath.row]!.prefix(4))
            setupMovie(imagePath[indexPath.row]!)

        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}
