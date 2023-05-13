//
//  Weapon.swift
//  D&D
//
//  Created by Anton Goncharov on 17.01.2022.
//

import Foundation

public struct Weapon: Codable {
    public let name: String
    public let dice: Dice
    public let ability: AbilityType

    public init(name: String, dice: Dice, ability: AbilityType) {
        self.name = name
        self.dice = dice
        self.ability = ability
    }
}

public extension Weapon {
    static var lightHammer = Weapon(name: "Light Hammer", dice: .d4, ability: .strength)
    static var lightCrossbow = Weapon(name: "Light Crossbow", dice: .d8, ability: .strength)
}
