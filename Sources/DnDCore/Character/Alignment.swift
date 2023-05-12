//
//  Alignment.swift
//  D&D
//
//  Created by Anton Goncharov on 07.03.2022.
//

import Foundation

public struct Alignment: Codable {

    public let ethic: Ethic
    public let moral: Moral

    public init(ethic: Ethic, moral: Moral) {
        self.ethic = ethic
        self.moral = moral
    }

    public var description: String {
        if case (.neutral, .neutral) = (ethic, moral) {
            return Alignment.trueNeutral
        } else {
            return ethic.rawValue.capitalized + " " + moral.rawValue.capitalized
        }
    }
    
    public enum Ethic: String, CaseIterable, Codable {
        case lawful
        case neutral
        case chaotic
    }

    public enum Moral: String, CaseIterable, Codable {
        case good
        case neutral
        case evil
    }
}


public extension Alignment {
    static var trueNeutral = "True Neutral"
}
