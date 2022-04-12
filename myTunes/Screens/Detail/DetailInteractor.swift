//
//  DetailInteractor.swift
//  myTunes
//
//  Created by Caner Onat on 12.04.2022.
//

import Foundation

protocol DetailInteractorOutputs: AnyObject {
}

final class DetailInteractor: BaseInteractor, Interactorable {
    weak var presenter: DetailInteractorOutputs?
    weak var entities: DetailEntities?
    
}
