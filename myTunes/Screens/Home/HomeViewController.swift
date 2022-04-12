//
//  HomeViewController.swift
//  myTunes
//
//  Created by Caner Onat on 12.04.2022.
//

import UIKit
import RxSwift

protocol HomeViewInputs: AnyObject {
    func prepareUI()
    func onCollectionViewSourceReady(source: HomeCollectionViewSource?)
    func onError(error: BaseModelError)
}

protocol HomeViewOutputs: AnyObject {
    func viewDidLoad()
    func onTermMediaSearch(term: String, media: String)
}

class HomeViewController: UIViewController {
    
    @IBOutlet weak var cvHome: UICollectionView!
    @IBOutlet weak var searchBarHome: UISearchBar!
    
    internal var presenter: HomeViewOutputs?
    
    let disposeBag = DisposeBag()
    var type : String = MediaType.software.rawValue
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    @objc func onViewTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    func changeMediaType(index : Int) {
        switch index {
        case 0:
            self.type = MediaType.software.rawValue
        case 1:
            self.type = MediaType.music.rawValue
        case 2:
            self.type = MediaType.movies.rawValue
        case 3:
            self.type =  MediaType.books.rawValue
        default:
            self.type = MediaType.software.rawValue
        }
    }
}

extension HomeViewController: HomeViewInputs {
    func prepareUI() {
        
        // MARK: view
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onViewTapped(_:)))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
        
        // MARK: collectionView
        cvHome.register(UINib(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeCollectionViewCell")
        DispatchQueue.main.asyncDeduped(target: self, after: 0.25) { [weak self] in
            self?.searchOnItunes()
        }
        
        // MARK: searchBarHome
        searchBarHome.backgroundImage = UIImage()
        searchBarHome.backgroundColor = .backgroundColor
        searchBarHome.barTintColor = .backgroundColor
        searchBarHome.delegate = self
        searchBarHome.searchTextField.rx
            .controlEvent(.editingChanged)
            .asObservable()
            .subscribe(onNext: { [weak self] in
                DispatchQueue.main.asyncDeduped(target: self!, after: 0.25) { [weak self] in
                    self?.searchOnItunes()
                }
            })
            .disposed(by: disposeBag)
    }
    
    func searchOnItunes() {
        let searchType = searchBarHome.selectedScopeButtonIndex
        changeMediaType(index: searchType)
        if let encodedString = searchBarHome.text?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed), encodedString != "" {
            presenter?.onTermMediaSearch(term: encodedString, media: type)
        } else {
            presenter?.onTermMediaSearch(term: type, media: type)
        }
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

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        changeMediaType(index: selectedScope)
        DispatchQueue.main.asyncDeduped(target: self, after: 0.25) { [weak self] in
            self?.searchOnItunes()
        }
    }
}
