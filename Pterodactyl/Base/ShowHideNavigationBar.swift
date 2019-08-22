//
//  ShowHideNavigationBar.swift
//  RaptorsApp
//
//  Created by Derek Cheung on 28/2/2018.
//  Copyright © 2018 NEX Team Inc. All rights reserved.
//

import UIKit

protocol ShowHideNavigationBar {
    func shouldShowNavigationBarAtViewWillAppear(_ shouldShow: Bool, useLargeTitle: Bool, showNavigationBorder: Bool, animated: Bool, barTintColor: UIColor, tintColor: UIColor)
}

extension ShowHideNavigationBar where Self: UIViewController {
    // DC: If the view controller is NOT inherit from BaseViewController, MUST call this to state whether you want to show the navigation bar or not
    func shouldShowNavigationBarAtViewWillAppear(_ shouldShow: Bool, useLargeTitle: Bool = false, showNavigationBorder: Bool = true, animated: Bool, barTintColor: UIColor = ColorScheme.white, tintColor: UIColor = ColorScheme.titleBlack) {
        // DC: Should only effective if you have no parent view controller
        var ignore = true

        if parent == nil {
            ignore = false
        } else if let parent = parent {
            if parent.isKind(of: UINavigationController.self) || parent.isKind(of: UITabBarController.self) {
                ignore = false
            }
        }

        if ignore == false {
            // Show/hide large title
            navigationController?.navigationBar.isTranslucent = useLargeTitle
            navigationController?.navigationBar.barTintColor = barTintColor
            navigationItem.largeTitleDisplayMode = useLargeTitle ? .always : .never
            navigationController?.navigationBar.tintColor = tintColor

            // Show/hide navigation border
            navigationController?.navigationBar.shadowImage = showNavigationBorder ? nil : UIImage()

            // Show/hide navigation bar
            navigationController?.setNavigationBarHidden(!shouldShow, animated: animated)
        }
    }
}
