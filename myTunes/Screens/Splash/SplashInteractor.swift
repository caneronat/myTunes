//
//  SplashInteractor.swift
//  myTunes
//
//  Created by Caner Onat on 12.04.2022.
//

import Foundation

protocol SplashInteractorOutputs: AnyObject {
    func onLoggedIn()
}

final class SplashInteractor: BaseInteractor, Interactorable {
    weak var presenter: SplashInteractorOutputs?
    weak var entities: SplashEntities?
    
    func onCheck(){
        self.presenter?.onLoggedIn()
    }
    
}
