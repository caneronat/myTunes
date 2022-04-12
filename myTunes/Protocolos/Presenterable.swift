//
//  Presenterable.swift
//  myTunes
//
//  Created by Caner Onat on 12.04.2022.
//

import Foundation

protocol Presenterable {
    associatedtype I: Interactorable
    associatedtype R: Routerable
    var dependencies: (interactor: I, router: R) { get }
}
