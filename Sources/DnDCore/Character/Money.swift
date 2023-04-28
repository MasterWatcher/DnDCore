//
//  Money.swift
//  D&D
//
//  Created by Anton Goncharov on 27.03.2023.
//

import Foundation

public struct Money: Codable {
    public var copper: Int = 0
    public var silver: Int = 0
    public var electrum: Int = 0
    public var gold: Int = 0
    public var platinum: Int = 0
}
