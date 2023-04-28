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

    public var level: Int {
        DnDCore.level(forExperience: experience)
    }
}
