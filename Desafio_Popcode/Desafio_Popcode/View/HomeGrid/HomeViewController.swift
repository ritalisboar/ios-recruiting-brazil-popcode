//
//  HomeViewController.swift
//  Desafio_Popcode
//
//  Created by Rita Lisboa on 26/04/22.
//

import UIKit


class HomeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    let headerId = "headerId"
    let padding: CGFloat = 30
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            let padding: CGFloat = 30
            layout.sectionInset = .init(top: padding, left: padding, bottom: padding, right: padding)
            layout.minimumLineSpacing = 30
        }
        
        collectionView?.backgroundColor = UIColor(named: "backgroundColor")
        collectionView?.contentInsetAdjustmentBehavior = .never
        collectionView?.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier:  cellId)
        collectionView?.register(HomeView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
//        filterButton()
    }

    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath)
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width - padding, height: 289)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 13
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160, height: 205)
    }
    
    // MARK: - filterButton
    
    private func filterButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "menuNavBar"),
            style: .done,
            target: self,
            action: nil)
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.scrollEdgeAppearance = .none
        navigationController?.navigationBar.isTranslucent = true
        
        let filter = FilterViewController()
        navigationController?.pushViewController(filter, animated: true)
    }
    
    
}

