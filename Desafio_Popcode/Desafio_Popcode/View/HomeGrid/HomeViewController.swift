//
//  HomeViewController.swift
//  Desafio_Popcode
//
//  Created by Rita Lisboa on 26/04/22.
//

import AlamofireImage
import UIKit

class HomeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var movieArray: [MovieParams] = []
    var filtered: [MovieParams] = []
    var isSearching: Bool = false
    
    let cellId = "cellId"
    let headerId = "headerId"
    let padding: CGFloat = 30
    var getMovies = MovieParamsPresenter()
    var movieAcount: [MovieParams]?
    let movieCVC = MovieCollectionViewCell()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        getMovies.getMovies()
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            let padding: CGFloat = 30
            layout.sectionInset = .init(top: padding, left: padding, bottom: padding + 70, right: padding)
            layout.minimumLineSpacing = 30
        }
        
        collectionView?.backgroundColor = UIColor(named: "backgroundColor")
        collectionView?.contentInsetAdjustmentBehavior = .never
        collectionView?.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier:  cellId)
        collectionView?.register(HomeView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
    }
    
    // MARK: - Movie collection view configuration
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath)
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width - padding, height: 289)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = movieAcount?.count {
            return count
        }
        return 20
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MovieCollectionViewCell
        let title = getMovies.movies.map({ $0.title })
        let imagePath = getMovies.movies.map({ $0.poster_path })

        func setupMovie(_ moviePath:String) {
            guard let imageUrl = URL(string: "https://image.tmdb.org/t/p/w185/\(moviePath)") else { return }
            cell.movieImg.af.setImage(for: .normal, url: imageUrl)
        }

        if title.count > 0 {
            cell.movieTitle.text = title[indexPath.row]
            setupMovie(imagePath[indexPath.row]!)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160, height: 190)
    }
 
    // MARK: - change to details page
    
    @objc func detailsPage() {
        changeToDetailsPage()
    }
    
    func changeToDetailsPage() {
        print("details")
        let detailsVC = DetailsViewController()
        navigationController?.pushViewController(detailsVC, animated: true)
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        isSearching = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        isSearching = false
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filtered.removeAll(keepingCapacity: false)
        let predicateString = searchBar.text!
        filtered = movieArray.filter( {$0.title?.range(of: predicateString) != nil})
        filtered.sort {$0.title! < $1.title!}
        isSearching = (filtered.count == 0) ? false : true
        collectionView.reloadData()
    }
}
