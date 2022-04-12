//
//  HomeViewController.swift
//  myTunes
//
//  Created by Caner Onat on 12.04.2022.
//

import UIKit

protocol HomeViewInputs: AnyObject {
    func prepareUI()
    func onCollectionViewSourceReady(source: HomeCollectionViewSource?)
    func onError(error: BaseModelError)
}

protocol HomeViewOutputs: AnyObject {
    func viewDidLoad()
}

class HomeViewController: UIViewController {
    
    @IBOutlet weak var cvHome: UICollectionView!
    @IBOutlet weak var searchBarHome: UISearchBar!
    internal var presenter: HomeViewOutputs?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        
    }

}

extension HomeViewController: HomeViewInputs {
    func prepareUI() {
        cvHome.register(UINib(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeCollectionViewCell")
    }
    
    func onCollectionViewSourceReady(source: HomeCollectionViewSource?) {
           cvHome.delegate = source
          cvHome.dataSource = source
          cvHome.reloadData()
        }
    
    func onError(error: BaseModelError) {
        AlertUtil.showStandardAlert(parentController: self, message: APIErrorGenerator().generateError(error: error))
    }
    
}

extension HomeViewController: Viewable {}
