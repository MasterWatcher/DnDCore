//
//  Skill.swift
//  D&D
//
//  Created by Anton Goncharov on 15.03.2023.
//

import Foundation

public enum Skill: String, CaseIterable, Codable {
    case acrobatics
    case animalHandling = "Animal Handling"
    case arcana
    case athletics
    case deception
    case history
    case insight
    case intimidation
    case investigation
    case medicine
    case nature
    case perception
    case performance
    case persuasion
    case religion
    case sleightOfHand = "Sleight Of Hand"
    case stealth
    case survival
}

public extension Skill {
    var ability: AbilityType {
        switch self {
        case .acrobatics:
            return .dexterity
        case .animalHandling:
            return .wisdom
        case .arcana:
            return .intelligence
        case .athletics:
            return .strength
        case .deception:
            return .charisma
        case .history:
            return .intelligence
        case .insight:
            return .wisdom
        case .intimidation:
            return .charisma
        case .investigation:
            return .intelligence
        case .medicine:
            return .wisdom
        case .nature:
            return .intelligence
        case .perception:
            return .wisdom
        case .performance:
            return .charisma
        case .persuasion:
            return .charisma
        case .religion:
            return .intelligence
        case .sleightOfHand:
            return .dexterity
        case .stealth:
            return .dexterity
        case .survival:
            return .wisdom
        }
    }
}

public extension Skill {
    var description: String {
        rawValue.capitalized
    }
}
