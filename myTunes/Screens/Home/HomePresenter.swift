//
//  HomePresenter.swift
//  myTunes
//
//  Created by Caner Onat on 12.04.2022.
//

import Foundation

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
        onUserCheck()
    }
    
    func onUserCheck() {
        DispatchQueue.main.async {
            self.setCollectionViewSource()
            //self.dependencies.interactor.onUserCheck()
        }
    }
    
    func setCollectionViewSource() {
        entities.source = HomeCollectionViewSource(presenter: self)
        view?.onCollectionViewSourceReady(source: entities.source)
    }
}

extension HomePresenter: HomeInteractorOutputs {
    
    func onUserLoggedIn() {
        //dependencies.router.presentRoot()
    }

    func onError(error: BaseModelError) {
        view?.onError(error: error)
    }

}
