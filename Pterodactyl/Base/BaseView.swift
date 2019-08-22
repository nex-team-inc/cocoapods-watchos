//
//  BaseView.swift
//  RaptorsApp
//
//  Created by Derek Cheung on 15/9/2017.
//  Copyright © 2017 NEX Team Inc. All rights reserved.
//

import PureLayout
import UIKit

class BaseView: UIView {
    // MARK: - Constant
    struct ScaleFactor {
        static let vertical: CGFloat = min(UIScreen.main.bounds.width, UIScreen.main.bounds.height) / 375.0
        static let horizontal: CGFloat = max(UIScreen.main.bounds.width, UIScreen.main.bounds.height) / 667.0
    }

	// MARK: - Initialization
	override init(frame: CGRect) {
		super.init(frame: frame)

		setupAll()
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)

        setupAll()
	}

	// MARK: - Setup All
	func setupAll() {
		// Override hook
		setup()
		setupLayer()
		setupConstraints()
	}

	// MARK: - Setup
	func setup() {
		// Override hook
	}

	// MARK: - Setup Layer
	func setupLayer() {
		// Override hook
	}

	// MARK: - Setup Constraints {
	func setupConstraints() {
		// Override hook
	}
}
