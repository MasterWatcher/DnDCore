//
//  Race.swift
//  D&D
//
//  Created by Anton Goncharov on 07.03.2022.
//

import Foundation

public enum Race: String {
    case dragonborn
    case dwarf
    case elf
    case gnome
    case halfElf
    case halfOrc
    case halfling
    case human
    case tiefling
}

public extension Race {
    var speed: Int {
        switch self {
        case .dwarf, .gnome, .halfling:
            return 25
        default:
            return 30
        }
    }
}
