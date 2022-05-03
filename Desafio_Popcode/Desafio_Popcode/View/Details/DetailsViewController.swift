//
//  DetailsViewController.swift
//  Desafio_Popcode
//
//  Created by Rita Lisboa on 30/04/22.
//

import UIKit

class DetailsViewController: UIViewController {

    private var customView: DetailsView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildDetailsView()
        // Do any additional setup after loading the view.
    }
    
    private func buildDetailsView() {
        view = DetailsView()
        customView = view as? DetailsView
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
