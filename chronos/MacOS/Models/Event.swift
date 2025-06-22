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

class Event {
    var date: Date
    var title: String
    var level: Level
    var material: Mat
    var state: Bool
    
    init() {
        self.date = Date()
        self.title = "haha"
        self.level = Level.Easy
        self.material = Mat.Book
        self.state = false
    }
}
