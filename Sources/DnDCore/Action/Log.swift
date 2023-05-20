//
//  Turn.swift
//  D&D
//
//  Created by Anton Goncharov on 15.01.2022.
//

import Foundation

public struct Log: Codable {

    public let name: String
    public let diceCount: Int
    public let dice: Dice
    public let throwsResult: [Int]
    public let modifier: ModifierLog?
    public let proficiencyBonus: Int?
    public let totalResult: Int

    public init(
        name: String,
        diceCount: Int,
        dice: Dice,
        throwsResult: [Int],
        modifier: ModifierLog?,
        proficiencyBonus: Int?,
        totalResult: Int) {
            self.name = name
            self.diceCount = diceCount
            self.dice = dice
            self.throwsResult = throwsResult
            self.modifier = modifier
            self.proficiencyBonus = proficiencyBonus
            self.totalResult = totalResult
        }
}
