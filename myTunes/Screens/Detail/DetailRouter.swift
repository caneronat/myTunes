//
//  DetailRouter.swift
//  myTunes
//
//  Created by Caner Onat on 12.04.2022.
//

import UIKit
import RxCocoa
import RxSwift

class DetailRouterInput: NSObject {
    var navControllerObserver: Disposable?
    
    func view(entryEntity: DetailEntryEntity) -> UIViewController {
        let view = DetailViewController()
        let interactor = DetailInteractor()
        let entities = DetailEntities(entryEntity: entryEntity)
        let dependencies = DetailPresenterDependencies(interactor: interactor, router: DetailRouterOutput(view))
        let presenter = DetailPresenter(entities: entities, dependencies: dependencies, view: view)
        view.presenter = presenter
        interactor.entities = entities
        interactor.presenter = presenter
        
        return view
    }
    
    func present(from: Viewable, entryEntity: DetailEntryEntity) {
        from.present(view(entryEntity: entryEntity), animated: true)
    }
}

class DetailRouterOutput: Routerable {
    private(set) weak var view: Viewable!
    var navControllerObserver: Disposable?

    init(_ view: Viewable) {
        self.view = view
    }
    
}

