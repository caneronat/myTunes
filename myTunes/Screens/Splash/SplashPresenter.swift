//
//  SplashPresenter.swift
//  myTunes
//
//  Created by Caner Onat on 12.04.2022.
//

import Foundation

typealias SplashPresenterDependencies = (
    interactor: SplashInteractor,
    router: SplashRouterOutput
)

final class SplashPresenter:BaseInteractor, Presenterable {
    internal var entities: SplashEntities
    private weak var view: SplashViewInputs?
    let dependencies: SplashPresenterDependencies
    
    init(entities: SplashEntities,
         dependencies: SplashPresenterDependencies, view: SplashViewInputs) {
        self.entities = entities
        self.dependencies = dependencies
        self.view = view
    }
}

extension SplashPresenter: SplashViewOutputs {
    func viewDidLoad() {
        setUI()
    }
    func setUI() {
        view?.prepareUI()
        onCheck()
    }
    
    func onCheck() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.dependencies.interactor.onCheck()
        }
    }
}

extension SplashPresenter: SplashInteractorOutputs {
    
    func onLoggedIn() {
        dependencies.router.presentHome()
    }
    
}
