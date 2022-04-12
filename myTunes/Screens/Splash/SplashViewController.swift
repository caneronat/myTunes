//
//  SplashViewController.swift
//  myTunes
//
//  Created by Caner Onat on 12.04.2022.
//

import UIKit

protocol SplashViewInputs: AnyObject {
    func prepareUI()
}

protocol SplashViewOutputs: AnyObject {
    func viewDidLoad()
}

class SplashViewController: UIViewController {
    
    @IBOutlet weak var lblMainTitle: UILabel!
    
    internal var presenter: SplashViewOutputs?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        
    }
    
}

extension SplashViewController: SplashViewInputs {
    func prepareUI() {
        mainScreenAnimation()
    }
    
    func mainScreenAnimation(){
        lblMainTitle.text = ""
        var charIndex = 0.0
        let titleText = "myTunes👽"
        
        for letter in titleText {
            Timer.scheduledTimer(withTimeInterval: 0.3 * charIndex, repeats: false) { (timer) in
                self.lblMainTitle.text?.append(letter)
            }
            charIndex += 1
        }
    }
    
}

extension SplashViewController: Viewable {}
