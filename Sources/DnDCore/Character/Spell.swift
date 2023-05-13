//
//  Spell.swift
//  D&D
//
//  Created by Anton Goncharov on 20.01.2022.
//

import Foundation

public struct Spell: Codable {
    public let name: String
    public let diceCount: Int
    public let dice: Dice
    public let modifier: Int?
    public let addPrimarySpellAbility: Bool
    public let isAttack: Bool

    public init(
        name: String,
        diceCount: Int = 1,
        dice: Dice,
        modifier: Int? = nil,
        addPrimarySpellAbility: Bool = false,
        isAttack: Bool = true) {
            self.name = name
            self.diceCount = diceCount
            self.dice = dice
            self.modifier = modifier
            self.addPrimarySpellAbility = addPrimarySpellAbility
            self.isAttack = isAttack
        }
}

public extension Spell {
    static let healingWord = Spell(name: "Healing Word", dice: .d4, addPrimarySpellAbility: true, isAttack: false)
    static let rayOfSickness = Spell(name: "Ray of Sickness", diceCount: 2, dice: .d8)
}
