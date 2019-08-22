//
//  PracticeSessionManager.swift
//  Pterodactyl
//
//  Created by Austin Kwong on 8/9/19.
//  Copyright © 2019 Austin Kwong. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
import WatchConnectivity

class PracticeSessionManager: NSObject {
    static let shared = PracticeSessionManager()

    // MARK: - Variable
    private let sessionRelay = PublishRelay<WCSession>()
    lazy var sessionObservable = sessionRelay.asObservable()
    private let messageRelay = PublishRelay<[String : Any]>()
    lazy var messageObservable = messageRelay.asObservable()

    private var watchConnectionSession = WCSession.default
    var state = MakeMissState()

    override init() {
        super.init()

        if isSupported() {
            watchConnectionSession.delegate = self
            watchConnectionSession.activate()
            print("Activating session")
        }

        print("isPaired?: \(watchConnectionSession.isPaired), isWatchAppInstalled?: \(watchConnectionSession.isWatchAppInstalled)")
    }

    // MARK: - Public
    func isSupported() -> Bool {
        return WCSession.isSupported()
    }

    func isReachable() -> Bool {
        return watchConnectionSession.isPaired && watchConnectionSession.isReachable
    }

    func reset() {
        state.reset()
        if isReachable() {
            let response = WatchSessionMessage(body: state.description, type: .response)
            watchConnectionSession.sendMessage(response.dictionary, replyHandler: nil)
        }
    }

    func addMake() {
        state.addMake()
        if isReachable() {
            let response = WatchSessionMessage(body: state.description, type: .response)
            watchConnectionSession.sendMessage(response.dictionary, replyHandler: nil)
        }
    }

    func addMiss() {
        state.addMiss()
        if isReachable() {
            let response = WatchSessionMessage(body: state.description, type: .response)
            watchConnectionSession.sendMessage(response.dictionary, replyHandler: nil)
        }
    }

}

// MARK: - <WCSessionDelegate>
extension PracticeSessionManager: WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        sessionRelay.accept(session)
        print("activationDidCompleteWith activationState:\(activationState) error:\(String(describing: error))")
    }

    func sessionDidBecomeInactive(_ session: WCSession) {
        sessionRelay.accept(session)
        print("sessionDidBecomeInactive: \(session)")
    }

    func sessionDidDeactivate(_ session: WCSession) {
        sessionRelay.accept(session)
        print("sessionDidDeactivate: \(session)")
    }

    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        messageRelay.accept(message)
        print("received request from watch: \(message)")
        if (message["request"] as? String) == "session_metrics_description" {
            replyHandler(["session_metrics_description" : state.description])
        }
    }
}
