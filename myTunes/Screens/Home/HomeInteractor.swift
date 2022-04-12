//
//  HomeInteractor.swift
//  myTunes
//
//  Created by Caner Onat on 12.04.2022.
//

import Foundation

protocol HomeInteractorOutputs: AnyObject {
    func onUserLoggedIn()
    func onError(error: BaseModelError)
}

final class HomeInteractor: BaseInteractor, Interactorable {
    weak var presenter: HomeInteractorOutputs?
    weak var entities: HomeEntities?


}
