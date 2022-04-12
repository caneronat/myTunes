//
//  HomePresenter.swift
//  myTunes
//
//  Created by Caner Onat on 12.04.2022.
//

import Foundation
import ProgressHUD

typealias HomePresenterDependencies = (
    interactor: HomeInteractor,
    router: HomeRouterOutput
)

final class HomePresenter:BaseInteractor, Presenterable {
    internal var entities: HomeEntities
    private weak var view: HomeViewInputs?
    let dependencies: HomePresenterDependencies
    
    init(entities: HomeEntities,
         dependencies: HomePresenterDependencies, view: HomeViewInputs) {
        self.entities = entities
        self.dependencies = dependencies
        self.view = view
    }
}

extension HomePresenter: HomeViewOutputs {
    
    func viewDidLoad() {
        setUI()
    }
    func setUI() {
        view?.prepareUI()
    }
    
    func setCollectionViewSource() {
        entities.source = HomeCollectionViewSource(presenter: self)
        view?.onCollectionViewSourceReady(source: entities.source)
    }
    
    func onTermMediaSearch(term: String, media: String) {
        if term.count > 2 {
            ProgressHUD.show()
            dependencies.interactor.getTermMediaSearch(term: term, media: media)
        } else {
            setCollectionViewSource()
        }
    }
    
    func onPresentDetail(data:Result){
        dependencies.router.presentDetail(data: data)
    }
    
}

extension HomePresenter: HomeInteractorOutputs {
    func onSuccess(model: [Result]) {
        ProgressHUD.dismiss()
        entities.dataModelList = model
        setCollectionViewSource()
    }
    
    func onError(error: BaseModelError) {
        ProgressHUD.dismiss()
        view?.onError(error: error)
    }
    
}
