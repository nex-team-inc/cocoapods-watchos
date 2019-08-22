//
//  SplashView.swift
//  Pterodactyl
//
//  Created by Austin Kwong on 8/9/19.
//  Copyright © 2019 Austin Kwong. All rights reserved.
//

import UIKit

class SplashView: BaseView {

    // MARK: - Private var
    private let iconImageView = UIImageView.newAutoLayout()

    // MARK: - Setup
    override func setup() {
        super.setup()

        backgroundColor = ColorScheme.bloodOrangeTwo
        setupIconImageView()
    }

    private func setupIconImageView() {
        iconImageView.image = Utils.isIPad() ? UIImage(named: "splash-logo-ipad") : UIImage(named: "splash-logo")
    }

    // MARK: - Setup Layer
    override func setupLayer() {
        super.setupLayer()

        addSubview(iconImageView)
    }

    // MARK: - Setup Constraints
    override func setupConstraints() {
        super.setupConstraints()

        setupIconImageViewConstraints()
    }

    private func setupIconImageViewConstraints() {
        iconImageView.autoCenterInSuperview()
    }
}
