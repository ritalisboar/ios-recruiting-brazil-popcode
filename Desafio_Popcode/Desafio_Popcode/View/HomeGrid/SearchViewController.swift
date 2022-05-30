//
//  SearchViewController.swift
//  Desafio_Popcode
//
//  Created by Rita Lisboa on 29/05/22.
//

import UIKit

class SearchViewController: UIViewController, UISearchResultsUpdating {
    
    let searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
