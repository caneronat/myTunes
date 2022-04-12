//
//  UIColor+Extension.swift
//  myTunes
//
//  Created by Caner Onat on 12.04.2022.
//

import UIKit

extension UIColor {
    static let primaryColor = UIColor(named: "color_primary")
    static let secondaryColor = UIColor(named: "color_secondary")
    static let backgroundColor = UIColor(named: "color_background")
    
    static var appColorPrimary: UIColor? = primaryColor
    static var appColorSecondary: UIColor? = secondaryColor
    static var appColorBackground: UIColor? = backgroundColor
}
