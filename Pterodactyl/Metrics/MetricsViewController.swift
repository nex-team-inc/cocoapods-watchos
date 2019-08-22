//
//  MetricsViewController.swift
//  Pterodactyl
//
//  Created by Austin Kwong on 8/9/19.
//  Copyright © 2019 Austin Kwong. All rights reserved.
//

import UIKit

class MetricsViewController: BaseViewController, HasCustomView {
    typealias CustomView = MetricsView

    private let sessionManager = PracticeSessionManager.shared

    override func loadView() {
        super.loadView()

        myView = MetricsView()
        myView?.delegate = self

        sessionManager.sessionObservable.subscribe(
            onNext: { [weak self] session in
                self?.myView?.debugLabelText = String(describing: session.activationState)
            }, onError: { [weak self] error in
                self?.myView?.debugLabelText = String(describing: error)
            }
        ).disposed(by: disposeBag)

        sessionManager.messageObservable.subscribe(
            onNext: { [weak self] msg in
                self?.myView?.messageLabelText = String(describing: msg)
            }, onError: { [weak self] error in
                self?.myView?.messageLabelText = String(describing: error)
            }
        ).disposed(by: disposeBag)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myView?.debugLabelText = "View Did Load"
        myView?.updateDisplay(displayMetrics: sessionManager.state.description)
    }
}

// MARK: - <LandingViewDelegate>
extension MetricsViewController: MetricsViewDelegate {
    func view(_ sender: MetricsView, resetPressed: UIButton) {
        sessionManager.reset()
        myView?.updateDisplay(displayMetrics: sessionManager.state.description)
    }

    func view(_ sender: MetricsView, addMissPressed: UIButton) {
        sessionManager.addMiss()
        myView?.updateDisplay(displayMetrics: sessionManager.state.description)
    }

    func view(_ sender: MetricsView, addMakePressed: UIButton) {
        sessionManager.addMake()
        myView?.updateDisplay(displayMetrics: sessionManager.state.description)
    }
}
