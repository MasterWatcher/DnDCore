//
//  Abilities.swift
//  D&D
//
//  Created by Anton Goncharov on 15.01.2022.
//

import Foundation

public typealias Ability = Int
public typealias Modifier = Int

public struct Abilities: Codable {
    public var strength: Ability
    public var dexterity: Ability
    public var constitution: Ability
    public var intelligence: Ability
    public var wisdom: Ability
    public var charisma: Ability

    public init(
        strength: Ability,
        dexterity: Ability,
        constitution: Ability,
        intelligence: Ability,
        wisdom: Ability,
        charisma: Ability){
            self.strength = strength
            self.dexterity = dexterity
            self.constitution = constitution
            self.intelligence = intelligence
            self.wisdom = wisdom
            self.charisma = charisma
        }
}

public extension Abilities {
    subscript(type: AbilityType) -> Int {
        switch type {
        case .strength: return strength
        case .dexterity: return dexterity
        case .constitution: return constitution
        case .intelligence: return intelligence
        case .wisdom: return wisdom
        case .charisma: return charisma
        }
    }
}

public extension Ability {
    var modifier: Int {
        Int((Double(self - 10) / 2.0).rounded(.down))
    }
}

public enum AbilityType: String, CaseIterable, Codable {
    case strength
    case dexterity
    case constitution
    case intelligence
    case wisdom
    case charisma
}

public extension AbilityType {
    var description: String {
        rawValue.capitalized
    }
}
