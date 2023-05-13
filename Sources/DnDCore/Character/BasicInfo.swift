//
//  BasicInfo.swift
//  D&D
//
//  Created by Anton Goncharov on 07.03.2022.
//

import Foundation

public struct BasicInfo: Codable {
    public let name: String
    public let `class`: Class
    public let background: String
    public let playerName: String
    public let race: Race
    public let alignment: Alignment
    public let experience: Int

    public init(
        name: String,
        `class`: Class,
        background: String,
        playerName: String,
        race: Race,
        alignment: Alignment,
        experience: Int) {
            self.name = name
            self.class = `class`
            self.background = background
            self.playerName = playerName
            self.race = race
            self.alignment = alignment
            self.experience = experience
        }

    public var level: Int {
        DnDCore.level(forExperience: experience)
    }
}
