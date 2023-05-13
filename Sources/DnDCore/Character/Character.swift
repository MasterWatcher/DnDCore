//
//  Character.swift
//  D&D
//
//  Created by Anton Goncharov on 13.02.2022.
//

import Foundation

public struct Character: Codable {
    public let basicInfo: BasicInfo
    public var abilities: Abilities
    public var inspiration: Bool
    public var hitPoints: HitPoints
    public var deathSaves: DeathSaves = .init(successes: .zero, failures: .zero)
    public var money: Money
    public var skills: [Skill]
    public var weapons: [Weapon]
    public var spells: [Spell]

    public init(
        basicInfo: BasicInfo,
        abilities: Abilities,
        inspiration: Bool,
        hitPoints: HitPoints,
        deathSaves: DeathSaves,
        money: Money,
        skills: [Skill],
        weapons: [Weapon],
        spells: [Spell]) {
            self.basicInfo = basicInfo
            self.abilities = abilities
            self.inspiration = inspiration
            self.hitPoints = hitPoints
            self.deathSaves = deathSaves
            self.money = money
            self.skills = skills
            self.weapons = weapons
            self.spells = spells
        }
}

public extension Character {

    var proficiencyBonus: Int {
        DnDCore.proficiencyBonus(forExperience: basicInfo.experience)
    }

    var primarySpellAbility: Ability {
        abilities[basicInfo.class.primarySpellAbilityType]
    }

    var passivePerception: Int {
        let bonus = skills.contains(.perception) ? proficiencyBonus : 0
        return 10 + abilities.wisdom.modifier + bonus
    }

    var armorClass: Int {
        switch basicInfo.class {
        case .barbarian:
            return 10 + abilities.dexterity.modifier + abilities.constitution.modifier
        case .monk:
            return 10 + abilities.dexterity.modifier + abilities.wisdom.modifier
        default:
            return 10 + abilities.dexterity.modifier
        }
    }

    var initiative: Int { abilities.dexterity.modifier }

    var hitPointsMax: Int  { basicInfo.class.hitDice.max + abilities.constitution.modifier }

    func modifierValue(for type: ModifierType) -> Modifier {
        switch type {
        case let .ability(ability):
            return abilities[ability].modifier
        case .primarySpellAbility:
            return primarySpellAbility.modifier
        case let .custom(value):
            return value
        case .none:
            return 0
        }
    }

    func modifierLog(for type: ModifierType) -> ModifierLog? {
        let value = modifierValue(for: type)
        switch type {
        case let .ability(ability):
            return .init(name: ability.description, value: value)
        case .primarySpellAbility:
            let ability = basicInfo.class.primarySpellAbilityType
            return .init(name: ability.description, value: value)
        case let .custom(value):
            return .init(name: "(\(value))", value: value)
        case .none:
            return nil
        }
    }

    func savingThrowValue(for type: AbilityType) -> Int {
        let isProfeciencyAbility = basicInfo.class.isSavingThrowProficiencyAbilitity(for: type)
        let proficiencyBonus = isProfeciencyAbility ? proficiencyBonus : 0
        return abilities[type].modifier + proficiencyBonus
    }

    func skillValue(for skill: Skill) -> Int {
        let value = abilities[skill.ability].modifier
        let proficiencyBonus = skills.contains(skill) ? proficiencyBonus : 0
        return value + proficiencyBonus
    }
}


public extension Character {
    static let fludd: Character =  .init(
        basicInfo: .init(name: "Fludd",
                         class: .artificer,
                         background: "",
                         playerName: "BunsLicker",
                         race: .dwarf,
                         alignment: .init(ethic: .lawful, moral: .good),
                         experience: 21010),
        abilities: .init(
            strength: 13,
            dexterity: 8,
            constitution: 15,
            intelligence: 16,
            wisdom: 14,
            charisma: 10),
        inspiration: true,
        hitPoints: .init(current: 10, temporary: 0),
        deathSaves: .init(successes: .two, failures: .zero),
        money: .init(gold: 100),
        skills: [.acrobatics, .perception, .medicine, .religion],
        weapons: [.lightHammer, .lightCrossbow],
        spells: [.healingWord, .rayOfSickness])
}
