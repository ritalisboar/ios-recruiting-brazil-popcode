//
//  FilterCollectionViewController.swift
//  Desafio_Popcode
//
//  Created by Rita Lisboa on 02/05/22.
//

import UIKit

protocol FilterViewControllerDelegate: AnyObject {
    func filterLits()
}

class FilterViewController: UIViewController {
    weak var delegate: FilterViewControllerDelegate?
}
