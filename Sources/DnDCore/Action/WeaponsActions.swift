//
//  WeaponsActions.swift
//  
//
//  Created by Anton Goncharov on 20.05.2023.
//

import Foundation

public extension [Weapon] {
    var actions: [Action] {
        return flatMap(buildWeaponBindings)

        func buildWeaponBindings(_ weapon: Weapon) -> [Action] {
            [.init(weapon: weapon, type: .attack), .init(weapon: weapon, type: .damage)]
        }
    }
}
