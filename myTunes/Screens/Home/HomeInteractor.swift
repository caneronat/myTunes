//
//  HomeInteractor.swift
//  myTunes
//
//  Created by Caner Onat on 12.04.2022.
//

import Foundation

protocol HomeInteractorOutputs: AnyObject {
    func onSuccess(model:[Result])
    func onError(error: BaseModelError)
}

final class HomeInteractor: BaseInteractor, Interactorable {
    weak var presenter: HomeInteractorOutputs?
    weak var entities: HomeEntities?
    
    func getTermMediaSearch(term:String,media:String) {
        services.getTermMedia(term:term, media:media) { (getTermMedia) in
            self.presenter?.onSuccess(model: getTermMedia.results)
        } errorCompletion: { (error) in
            self.presenter?.onError(error: error)
        }
    }
}
