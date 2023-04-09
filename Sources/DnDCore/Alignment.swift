//
//  Alignment.swift
//  D&D
//
//  Created by Anton Goncharov on 07.03.2022.
//

import Foundation

public struct Alignment {
    public let ethic: Ethic
    public let moral: Moral

    public var description: String {
        if case (.neutral, .neutral) = (ethic, moral) {
            return "True Neutral"
        } else {
            return ethic.rawValue.capitalized + " " + moral.rawValue.capitalized
        }
    }
    
    public enum Ethic: String {
        case lawful
        case neutral
        case chaotic
    }

    public enum Moral: String {
        case good
        case neutral
        case evil
    }
}
