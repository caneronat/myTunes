//
//  HomeRouter.swift
//  myTunes
//
//  Created by Caner Onat on 12.04.2022.
//

import UIKit
import RxCocoa
import RxSwift

class HomeRouterInput: NSObject {
    func view(entryEntity: HomeEntryEntity) -> UIViewController {
        let view = HomeViewController()
        let interactor = HomeInteractor()
        let entities = HomeEntities(entryEntity: entryEntity)
        let dependencies = HomePresenterDependencies(interactor: interactor, router: HomeRouterOutput(view))
        let presenter = HomePresenter(entities: entities, dependencies: dependencies, view: view)
        view.presenter = presenter
        interactor.entities = entities
        interactor.presenter = presenter
        
        return view
    }
    
    func present(from: Viewable, entryEntity: HomeEntryEntity) {
        from.present(view(entryEntity: entryEntity), animated: false)
    }
}

class HomeRouterOutput: Routerable {
    private(set) weak var view: Viewable!
    var navControllerObserver: Disposable?

    init(_ view: Viewable) {
        self.view = view
    }
    
    func presentHome() {
        //HomeRouterInput().present(from: view, entryEntity: HomeEntryEntity())
    }
    

}
