//
//  DetailsViewController.swift
//  Desafio_Popcode
//
//  Created by Rita Lisboa on 30/04/22.
//

import UIKit
import Alamofire
import AlamofireImage

class DetailsViewController: UIViewController, UIGestureRecognizerDelegate {

    private var customView: DetailsView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildDetailsView()
    }
    
    private func buildDetailsView() {
        view = DetailsView()
        customView = view as? DetailsView
    }
    
    @objc func backButtonAction() {
        changeToHomePage()
    }
    
    func changeToHomePage() {
        print("hello")
        let homeVC = HomeViewController()
        navigationController?.pushViewController(homeVC, animated: true)
        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }

}
