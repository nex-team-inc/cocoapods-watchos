//
//  BaseViewController.swift
//  RaptorsApp
//
//  Created by Derek Cheung on 15/9/2017.
//  Copyright © 2017 NEX Team Inc. All rights reserved.
//

import RxSwift
import UIKit

class BaseViewController: UIViewController, ShowHideNavigationBar {

    // MARK: - Public Variables
    var colorScheme = Utils.getCurrentColorScheme() { didSet { updateColors() } }
    // DC: Switch on this flag at viewDidLoad() if you want to have deviceDidRotate(with orientation:) callback
    var monitorDeviceOrientation: Bool = false

    // DC: Switch on this flag at viewDidLoad() if you want to show navigation bar
    var shouldShowNavigationBar: Bool = true
    var shouldShowLargeTitle: Bool = false
    var shouldShowNavigationBorder: Bool = true
    var parentShouldHandleNavigationBar: Bool = true
    var presenterShouldChangeNavigationBar: Bool = false
    var navigationBarTint: UIColor? {
        didSet {
            self.navigationController?.navigationBar.tintColor = navigationBarTint
        }
    }
    var navigationBarStyle: UIBarStyle? {
        didSet {
            self.navigationController?.navigationBar.barStyle = navigationBarStyle ?? .default
        }
    }
    var navigationBarColor: UIColor? {
        didSet {
            self.navigationController?.navigationBar.barTintColor = navigationBarColor
        }
    }
    let disposeBag = DisposeBag()

    // MARK: - View Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Update View's colors if scheme changes
        let currentScheme = Utils.getCurrentColorScheme()
        if colorScheme.name != currentScheme.name {
            colorScheme = currentScheme
        }
        if parentShouldHandleNavigationBar {
            shouldShowNavigationBarAtViewWillAppear(shouldShowNavigationBar,
                                                useLargeTitle: shouldShowLargeTitle,
                                                showNavigationBorder: shouldShowNavigationBorder,
                                                animated: animated)
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        if monitorDeviceOrientation {
            NotificationCenter.default.addObserver(self,
                                                   selector: #selector(deviceRotated),
                                                   name: UIDevice.orientationDidChangeNotification,
                                                   object: nil)
        }
    }
    override func willMove(toParent parent: UIViewController?) {
        if presenterShouldChangeNavigationBar {
            //parent is nil.
            guard let count = self.navigationController?.viewControllers.count else { return }

            // XXX (Philip): This logic is pretty ad-hoc and seems quite error prone, @Patrick, let's think of a better way to handle it.
            if count > 1,
                let presenter = self.navigationController?.viewControllers[count - 2] as? BaseViewController {
                self.navigationController?.navigationBar.barTintColor = presenter.navigationBarColor
                self.navigationController?.navigationBar.tintColor = presenter.navigationBarTint
                self.navigationController?.navigationBar.barStyle = presenter.navigationBarStyle ?? .default
            }
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        if monitorDeviceOrientation {
            NotificationCenter.default.removeObserver(self,
                                                      name: UIDevice.orientationDidChangeNotification,
                                                      object: nil)
        }
    }

    // MARK: - Notification
    @objc private func deviceRotated() {
        deviceDidRotate(with: UIDevice.current.orientation)
    }

    // MARK: - Public
    func updateColors() {
        // Override hook
    }

    func deviceDidRotate(with orientation: UIDeviceOrientation) {
        // Override hook
    }
}
