//
//  SpellsActions.swift
//  
//
//  Created by Anton Goncharov on 20.05.2023.
//

import Foundation

public extension [Spell] {
    var actions: [Action] {
        return flatMap(buildSpellsBindings)

        func buildSpellsBindings(_ spell: Spell) -> [Action] {
            if spell.isAttack {
                return [.init(spell: spell, type: .attack), .init(spell: spell, type: .damage)]
            } else {
                return [.init(spell: spell, type: .nonAttack)]
            }
        }
    }
}
