//
//  DeathSaves.swift
//  D&D
//
//  Created by Anton Goncharov on 25.03.2023.
//

import Foundation

public struct DeathSaves: Codable {
    public let successes: Throw
    public let failures: Throw

    public init(successes: Throw, failures: Throw) {
        self.successes = successes
        self.failures = failures
    }

    public enum Throw: Int, Codable {
        case zero
        case one
        case two
        case three
    }
}
