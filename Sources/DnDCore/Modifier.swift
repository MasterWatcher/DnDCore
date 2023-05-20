//
//  Modifier.swift
//  D&D
//
//  Created by Anton Goncharov on 22.01.2022.
//

import Foundation

public enum ModifierType: Codable {
    case ability(AbilityType)
    case primarySpellAbility
    case custom(value: Int)
    case none
}
