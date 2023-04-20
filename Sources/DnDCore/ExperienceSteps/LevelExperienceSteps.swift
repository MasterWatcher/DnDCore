//
//  File.swift
//  
//
//  Created by Anton Goncharov on 20.04.2023.
//

import Foundation

func level(forExperience experience: Int) -> Int {
    switch experience {
    case ..<300: return 1
    case ..<900: return 2
    case ..<2_700: return 3
    case ..<6_500: return 4
    case ..<14_000: return 5
    case ..<23_000: return 6
    case ..<34_000: return 7
    case ..<48_000: return 8
    case ..<64_000: return 9
    case ..<85_000: return 10
    case ..<100_000: return 11
    case ..<120_000: return 12
    case ..<140_000: return 13
    case ..<165_000: return 14
    case ..<195_000: return 15
    case ..<225_000: return 16
    case ..<265_000: return 17
    case ..<305_000: return 18
    case ..<355_000: return 19
    default: return 20
    }
}

func proficiencyBonus(forExperience experience: Int) -> Int {
    switch experience {
    case ..<6_500: return 2
    case ..<48_000: return 3
    case ..<120_000: return 4
    case ..<225_000: return 5
    default: return 6
    }
}
