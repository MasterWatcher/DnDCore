//
//  Dice.swift
//  D&D
//
//  Created by Anton Goncharov on 16.01.2022.
//

import Foundation

public enum Dice: String, CaseIterable, Codable {
    case d4
    case d6
    case d8
    case d10
    case d12
    case d20
}

public extension Dice {

    var max: Int {
        switch self {
        case .d4: return 4
        case .d6: return 6
        case .d8: return 8
        case .d10: return 10
        case .d12: return 12
        case .d20: return 20
        }
    }

    private var range: ClosedRange<Int> { 1...max }

    func `throw`() -> Int {
        Int.random(in: range)
    }
}
