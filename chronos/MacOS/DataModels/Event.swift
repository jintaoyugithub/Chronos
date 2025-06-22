//
//  Event.swift
//  chronos
//
//  Created by Jintao Yu on 2025/6/21.
//

import Foundation

enum Level {
    case Easy
    case Middle
    case Hard
    case NumOfLevels
}

enum Mat {
    case Video
    case Book
    case Coding
}

struct Event {
    var id: Int
    var date: Date
    var title: String
    var level: Level
    var mat: Mat
    var state: Bool
}
