//
//  CharacterActions.swift
//  
//
//  Created by Anton Goncharov on 20.05.2023.
//

import Foundation

public extension Character {
    var actions: [Action] {
        [Action.initiative] + weapons.actions + spells.actions
    }
}

public extension Character {

    func perform(action: Action) -> Log {
        let throwsResult = (0..<action.diceCount).map { _ in action.dice.throw() }
        return perform(action: action, throwsResult: throwsResult)
    }

    func perform(action: Action, throwsResult: [Int]) -> Log {
        let modifier = modifierValue(for: action.modifier)
        let proficiencyBonus = action.useProficiencyBonus ? proficiencyBonus : 0
        let totalResult = throwsResult.reduce(0, +) + modifier + proficiencyBonus
        let modifierLog = modifierLog(for: action.modifier)

        let log = Log(
            name: action.name,
            diceCount: action.diceCount,
            dice: action.dice,
            throwsResult: throwsResult,
            modifier: modifierLog,
            proficiencyBonus: action.useProficiencyBonus ? proficiencyBonus : nil,
            totalResult: totalResult)

        return log
    }
}
