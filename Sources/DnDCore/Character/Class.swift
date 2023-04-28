//
//  Class.swift
//  D&D
//
//  Created by Anton Goncharov on 20.01.2022.
//

import Foundation

public enum Class: String, CaseIterable, Codable {
    case artificer
    case barbarian
    case bard
    case cleric
    case druid
    case fighter
    case monk
    case paladin
    case ranger
    case rogue
    case sorcerer
    case warlock
    case wizard
}

public extension Class {
    var primarySpellAbilityType: AbilityType {
        switch self {
        case .artificer: return .intelligence
        case .barbarian: return .strength
        case .bard: return .charisma
        case .cleric: return .wisdom
        case .druid: return .wisdom
        case .fighter: return .strength
        case .monk: return .wisdom
        case .paladin: return .charisma
        case .ranger: return .wisdom
        case .rogue: return .dexterity
        case .sorcerer: return .charisma
        case .warlock: return .charisma
        case .wizard: return .intelligence
        }
    }

    var savingThrowProficienciesAbilitiesTypes: (AbilityType, AbilityType) {
        switch self {
        case .artificer: return (.constitution, .intelligence)
        case .barbarian: return (.strength, .constitution)
        case .bard: return (.dexterity, .charisma)
        case .cleric: return (.wisdom, .charisma)
        case .druid: return (.intelligence, .wisdom)
        case .fighter: return (.strength, .constitution)
        case .monk: return (.strength, .dexterity)
        case .paladin: return (.wisdom, .charisma)
        case .ranger: return (.strength, .dexterity)
        case .rogue: return (.dexterity, .intelligence)
        case .sorcerer: return (.constitution, .charisma)
        case .warlock: return (.wisdom, .charisma)
        case .wizard: return (.intelligence, .wisdom)
        }
    }

    var hitDice: Dice {
        switch self {
        case .sorcerer, .wizard:
            return .d6
        case .fighter, .paladin, .ranger:
            return .d10
        case .barbarian: return .d12
        default:
            return .d8
        }
    }

    func isSavingThrowProficiencyAbilitity(for type: AbilityType) -> Bool {
        let (firstAbility, secondAbility) = savingThrowProficienciesAbilitiesTypes
        return firstAbility == type || secondAbility == type
    }
}

