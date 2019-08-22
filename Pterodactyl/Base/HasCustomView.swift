//
//  HasCustomView.swift
//  Pterodactyl
//
//  Created by Austin Kwong on 8/9/19.
//  Copyright © 2019 Austin Kwong. All rights reserved.
//

import UIKit

protocol HasCustomView: class {
    associatedtype CustomView: UIView
    var myView: CustomView? { get set }
}

extension HasCustomView where Self: UIViewController {
    var myView: CustomView? {
        get {
            return view as? CustomView
        }
        set {
            view = newValue
        }
    }
}
