//
//  SplashViewController.swift
//  myTunes
//
//  Created by Caner Onat on 12.04.2022.
//

import UIKit

protocol SplashViewInputs: AnyObject {
    func prepareUI()
    func onError(error: BaseModelError)
}

protocol SplashViewOutputs: AnyObject {
    func viewDidLoad()
}

class SplashViewController: UIViewController {
    
    internal var presenter: SplashViewOutputs?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        
    }

}

extension SplashViewController: SplashViewInputs {
    func prepareUI() {
    }
    
    func onError(error: BaseModelError) {
        AlertUtil.showStandardAlert(parentController: self, message: APIErrorGenerator().generateError(error: error))
    }
    
}

extension SplashViewController: Viewable {}
