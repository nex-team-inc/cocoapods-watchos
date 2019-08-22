//
//  MetricsInterfaceController.swift
//  Pterodactyl WatchKit Extension
//
//  Created by Austin Kwong on 8/9/19.
//  Copyright © 2019 Austin Kwong. All rights reserved.
//

import Foundation
import WatchConnectivity
import WatchKit


class MetricsInterfaceController: WKInterfaceController {

    @IBOutlet var metricsLabel: WKInterfaceLabel!

    private var session = WCSession.default

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        metricsLabel.setText("No Session")

        if WCSession.isSupported() {
            session.delegate = self
            session.activate()

            sendRequestForData()
        } else {
            print("Not supported")
        }
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        sendRequestForData()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    // MARK: - Helpers
    private func sendRequestForData() {
        guard session.isReachable else {
            print("Session unreachable")
            return
        }

        session.sendRequest(.sessionMetricsDescription,
                            replyHandler: { [weak self] message in
                                    self?.metricsLabel.setText(message.body)
            }, errorHandler: { error in
                print(error.localizedDescription)
        })
    }
}

extension MetricsInterfaceController: WCSessionDelegate {

    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        print("activationDidCompleteWith activationState:\(activationState) error:\(String(describing: error))")
    }

    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        if let message = WatchSessionMessage.parseFromDictionary(message) {
            self.metricsLabel.setText(message.body)
        }
    }
}
