//
//  SplashViewController.swift
//  Pterodactyl
//
//  Created by Austin Kwong on 8/9/19.
//  Copyright © 2019 Austin Kwong. All rights reserved.
//

import UIKit

class SplashViewController: BaseViewController, HasCustomView {
    // MARK: - Private var
    typealias CustomView = SplashView

    // MARK: - View Lifecycle
    override func loadView() {
        myView = SplashView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        shouldShowNavigationBar = false
    }

    // MARK: - Override
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
