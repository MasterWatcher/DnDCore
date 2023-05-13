//
//  HitPoints.swift
//  D&D
//
//  Created by Anton Goncharov on 19.03.2023.
//

import Foundation

public struct HitPoints: Codable {
    public var current: Int
    public var temporary: Int

    public init(current: Int, temporary: Int) {
        self.current = current
        self.temporary = temporary
    }
}
