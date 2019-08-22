//
//  MakeMissState.swift
//  Pterodactyl
//
//  Created by Austin Kwong on 8/9/19.
//  Copyright © 2019 Austin Kwong. All rights reserved.
//
class MakeMissState {
    var makes: Int
    var misses: Int
    var total: Int {
        return makes + misses
    }
    var description: String {
        return "\(makes) / \(total)"
    }

    init() {
        makes = 0
        misses = 0
    }

    func reset() {
        makes = 0
        misses = 0
    }

    func addMake() {
        makes += 1
    }

    func addMiss() {
        misses += 1
    }
}
