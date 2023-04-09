//
//  DeathSaves.swift
//  D&D
//
//  Created by Anton Goncharov on 25.03.2023.
//

import Foundation

public struct DeathSaves {
    public let successes: Throw
    public let failures: Throw

    public enum Throw: Int {
        case zero
        case one
        case two
        case three
    }
}
