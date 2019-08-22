//
//  UIFontExtension.swift
//  RaptorsApp
//
//  Created by Derek Cheung on 19/9/2017.
//  Copyright © 2017 NEX Team Inc. All rights reserved.
//

import UIKit

extension UIFont {

    // MARK: - Constants
    enum FontType: String {
        case helveticaBold = "Helvetica-Bold"
        case helveticaNeue = "HelveticaNeue"
        case helveticaNeueMedium = "HelveticaNeue-Medium"
        case helveticaNeueBold = "HelveticaNeue-Bold"
        case helveticaNeueLight = "HelveticaNeue-Light"
        case norwesterRegular = "Norwester-Regular"
        case raptorsBold = "CooperHewitt-Bold"
        case raptorsBoldItalic = "CooperHewitt-BoldItalic"
        case raptorsBook = "CooperHewitt-Book"
        case raptorsHeavy = "CooperHewitt-Heavy"
        case raptorsLight = "CooperHewitt-Light"
        case raptorsMedium = "CooperHewitt-Medium"
        case raptorsMediumItalic = "CooperHewitt-MediumItalic"
        case raptorsSemibold = "CooperHewitt-Semibold"
        case raptorsThin = "CooperHewitt-Thin"
        case fontAwesome = "FontAwesome"
    }

    // MARK: - Public
    static func getFont(_ fontType: FontType, fontSize: CGFloat) -> UIFont {
        return UIFont(name: fontType.rawValue, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }

    // UIFont.capHeight of "Norwester" actually refers to the height of
    // its small cap "x". Use this multipler to get the adjusted cap height
    // for the big cap "X".
    static let norwesterBigCapHeightMultiplier = CGFloat(241) / CGFloat(210)
}
