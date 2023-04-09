//
//  Spell.swift
//  D&D
//
//  Created by Anton Goncharov on 20.01.2022.
//

import Foundation

public struct Spell: Codable {
    public let name: String
    public var diceCount: Int = 1
    public let dice: Dice
    public var modifier: Int? = nil
    public var addPrimarySpellAbility = false
    public var isAttack: Bool = true
}
