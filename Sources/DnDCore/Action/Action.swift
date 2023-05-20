//
//  ActionBinding.swift
//  D&D
//
//  Created by Anton Goncharov on 13.02.2022.
//

import Foundation

public struct Action: Codable {
    public let name: String
    public let diceCount: Int
    public let dice: Dice
    public let modifier: ModifierType
    public let useProficiencyBonus: Bool

    public init(
        name: String,
        diceCount: Int = 1,
        dice: Dice,
        modifier: ModifierType,
        useProficiencyBonus: Bool = false) {
            self.name = name
            self.diceCount = diceCount
            self.dice = dice
            self.modifier = modifier
            self.useProficiencyBonus = useProficiencyBonus
        }
}

public extension Action {
    enum WeaponBindingType: String {
        case attack
        case damage
    }

    init(weapon: DnDCore.Weapon, type: WeaponBindingType) {
        self.init(
            name: weapon.name + " " + type.rawValue.capitalized,
            dice: type == .attack ? .d20 : weapon.dice,
            modifier: .ability(weapon.ability),
            useProficiencyBonus: type == .attack
        )
    }
}

public extension Action {
    enum SpellBindingType: String {
        case attack
        case damage
        case nonAttack = "use"
    }

    init(spell: Spell, type: SpellBindingType) {
        let name = spell.name + " " + type.rawValue.capitalized
        let diceCount: Int
        let dice: Dice
        let modifier: ModifierType
        let useProficiencyBonus: Bool

        switch type {
        case .attack:
            dice = .d20
            diceCount = 1
            modifier = .primarySpellAbility
            useProficiencyBonus = true
        case .damage, .nonAttack:
            diceCount = spell.diceCount
            dice = spell.dice
            modifier = spell.addPrimarySpellAbility ? .primarySpellAbility : .none
            useProficiencyBonus = false
        }

        self.init(
            name: name,
            diceCount: diceCount,
            dice: dice,
            modifier: modifier,
            useProficiencyBonus: useProficiencyBonus
        )
    }
}

public extension Action {
    static var initiative: Action = .init(name: "Initiative", dice: .d20, modifier: .ability(.dexterity))
}
