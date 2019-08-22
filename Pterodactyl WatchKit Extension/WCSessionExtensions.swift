//
//  WCSessionExtensions.swift
//  Pterodactyl WatchKit Extension
//
//  Created by Austin Kwong on 8/12/19.
//  Copyright © 2019 Austin Kwong. All rights reserved.
//

import WatchConnectivity

extension WCSession {
    func sendRequest(_ request: WatchSessionRequest, replyHandler: ((WatchSessionMessage) -> Void)?, errorHandler: ((Error) -> Void)? = nil) {
        let requestMessageDict = WatchSessionMessage.forClientRequest(request: request).dictionary
        if !requestMessageDict.isEmpty {
            self.sendMessage(requestMessageDict, replyHandler: transform(messageHandler: replyHandler), errorHandler: errorHandler)
        } else {
            print("Unable to construct non-empty message for request \(request)")
        }
    }

    private func transform(messageHandler: ((WatchSessionMessage) -> Void)?) -> ((([String : Any]) -> Void))? {
        guard let messageHandler = messageHandler else { return nil }
        return { reply in
            do {
                let replyMessage = try WatchSessionMessage(dictionary: reply)
                messageHandler(replyMessage)
            } catch {
                print("Error decoding watch message \(error)")
            }
        }
    }
}
