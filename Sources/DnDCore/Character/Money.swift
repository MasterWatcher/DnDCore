//
//  Money.swift
//  D&D
//
//  Created by Anton Goncharov on 27.03.2023.
//

import Foundation

public struct Money: Codable {
    public var copper: Int
    public var silver: Int
    public var electrum: Int
    public var gold: Int
    public var platinum: Int

    public init(
        copper: Int = 0,
        silver: Int = 0,
        electrum: Int = 0,
        gold: Int = 0,
        platinum: Int = 0
    ) {
        self.copper = copper
        self.silver = silver
        self.electrum = electrum
        self.gold = gold
        self.platinum = platinum
    }
}
