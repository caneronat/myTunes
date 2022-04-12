//
//  APIErrorGenerator.swift
//  myTunes
//
//  Created by Caner Onat on 12.04.2022.
//

import Foundation
import UIKit

public class APIErrorGenerator{
    func generateError(error: BaseModelError) -> String{
        var alertText = ""
        if error.message != nil{
            alertText = error.message!
        }
        
        if alertText == ""{
            alertText = "An unknown error has occurred."
        }
        
        return alertText
    }
}
