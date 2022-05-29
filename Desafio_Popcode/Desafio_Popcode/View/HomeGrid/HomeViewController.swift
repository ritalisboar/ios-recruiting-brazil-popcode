//
//  HomeViewController.swift
//  Desafio_Popcode
//
//  Created by Rita Lisboa on 26/04/22.
//

import UIKit


class HomeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    private var customHomeView: HomeView? = nil
    let cellId = "cellId"
    let headerId = "headerId"
    let padding: CGFloat = 30
    var getMovies = MovieParamsPresenter()
    let movieCVC = MovieCollectionViewCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getMovies.getMovies()
        navigationController?.setNavigationBarHidden(true, animated: true)

        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            let padding: CGFloat = 30
            layout.sectionInset = .init(top: padding, left: padding, bottom: padding, right: padding)
            layout.minimumLineSpacing = 30
        }
        
        collectionView?.backgroundColor = UIColor(named: "backgroundColor")
        collectionView?.contentInsetAdjustmentBehavior = .never
        collectionView?.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier:  cellId)
        collectionView?.register(HomeView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
    }
    
    private func buildView() {
        view = HomeView()
        customHomeView = view as? HomeView

    }
    
    // MARK: - Filter button action
    
    @objc func filterButtonAction() {
        changeToFilterPage()
    }
    
    func changeToFilterPage() {
        print("hello")
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
        let cellsNumber = getMovies.movies.map({ $0.title})
        return 20
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MovieCollectionViewCell
        let title = getMovies.movies.map({ $0.title })
        if title.count > 0 {
            cell.movieTitle.text = title[indexPath.row]
        }
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let details = DetailsViewController()
        details.navigationController?.pushViewController(details, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160, height: 230)
    }
 
    // MARK: - change to details page
    
    @objc func detailsPage() {
        changeToDetailsPage()
    }
    
    func changeToDetailsPage() {
        print("details")
    }
    
    // MARK: - make favorite movie

    @objc func favoriteButtonAction() {
        makeFavoriteMovie()
    }
    
    func makeFavoriteMovie() {
        print("fav")
    }
    
}


