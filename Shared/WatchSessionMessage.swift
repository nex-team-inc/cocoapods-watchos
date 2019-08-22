//
//  WatchSessionMessage.swift
//  Pterodactyl
//
//  Created by Austin Kwong on 8/12/19.
//  Copyright © 2019 Austin Kwong. All rights reserved.
//

import CodableFirebase
import Foundation

enum MessageType: String, Codable {
    case response
    case request
}

enum WatchSessionRequest: String, Codable {
    case sessionMetricsDescription = "session_metrics_description"
}

struct WatchSessionMessage: Codable {

    enum CodingKeys: String, CodingKey {
        case body
        case errors
        case type
    }

    let body: String
    let type: MessageType
    let errors: [String]
    var dictionary: [String : Any] {
        return FirestoreEncoder().encodeOptional(self) ?? [:]
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decode(MessageType.self, forKey: .type)
        body = try container.decode(String.self, forKey: .body)
        errors = try container.decode([String].self, forKey: .errors)
    }

    init(body: String, type: MessageType, errors: [String] = []) {
        self.body = body
        self.type = type
        self.errors = errors
    }

    init(dictionary: [String: Any]) throws {
        let jsonData = try JSONSerialization.data(withJSONObject: dictionary, options: [])
        let result = try JSONDecoder().decode(WatchSessionMessage.self, from: jsonData)
        self = result
    }

    static func forClientRequest(request: WatchSessionRequest) -> WatchSessionMessage {
        return WatchSessionMessage(body: request.rawValue, type: .request)
    }

    static func parseFromDictionary(_ dictionary: [String : Any]) -> WatchSessionMessage? {
        do {
            let replyMessage = try WatchSessionMessage(dictionary: dictionary)
            return replyMessage
        } catch {
            print("Error decoding watch message \(error)")
            return nil
        }
    }
}

extension FirestoreEncoder {
    func encodeOptional<Value: Encodable>(_ value: Value) -> [String: Any]? {
        do {
            return try encode(value)
        } catch {
            print("Error occurred when encoding \(value) using FirestoreEncoder, error: \(error)")
            return nil
        }
    }
}
