//
//  SplashRouter.swift
//  myTunes
//
//  Created by Caner Onat on 12.04.2022.
//

import UIKit
import RxCocoa
import RxSwift

class SplashRouterInput: NSObject {
    func view(entryEntity: SplashEntryEntity) -> UIViewController {
        let view = SplashViewController()
        let interactor = SplashInteractor()
        let entities = SplashEntities(entryEntity: entryEntity)
        let dependencies = SplashPresenterDependencies(interactor: interactor, router: SplashRouterOutput(view))
        let presenter = SplashPresenter(entities: entities, dependencies: dependencies, view: view)
        view.presenter = presenter
        interactor.entities = entities
        interactor.presenter = presenter
        
        return view
    }
}

class SplashRouterOutput: Routerable {
    private(set) weak var view: Viewable!
    var navControllerObserver: Disposable?

    init(_ view: Viewable) {
        self.view = view
    }
    
    func presentHome() {
        HomeRouterInput().present(from: view, entryEntity: HomeEntryEntity())
    }
    

}
