//
//  APIErrors.swift
//  myTunes
//
//  Created by Caner Onat on 12.04.2022.
//

import Foundation

public enum APIErrors: String {
    case Alamofire
    case Fatal
    case EmptyField
    case TooManyRequests
    case Service
    
    var localized: String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
}
