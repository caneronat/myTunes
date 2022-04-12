//
//  DetailPresenter.swift
//  myTunes
//
//  Created by Caner Onat on 12.04.2022.
//

import UIKit

typealias DetailPresenterDependencies = (
    interactor: DetailInteractor,
    router: DetailRouterOutput
)

final class DetailPresenter: Presenterable {
    internal var entities: DetailEntities
    private weak var view: DetailViewInputs?
    let dependencies: DetailPresenterDependencies
    
    init(entities: DetailEntities,
         dependencies: DetailPresenterDependencies, view: DetailViewInputs) {
        self.entities = entities
        self.dependencies = dependencies
        self.view = view
    }
}

extension DetailPresenter: DetailViewOutputs {
    func viewDidLoad() {
        setUI()
    }
    
    func setUI() {
        view?.prepareUI()
        view?.onDetail(data: entities.entryEntity.detail)
    }

}

extension DetailPresenter: DetailInteractorOutputs {
 
}
