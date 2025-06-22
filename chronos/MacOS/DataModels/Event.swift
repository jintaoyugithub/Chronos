//
//  Event.swift
//  chronos
//
//  Created by Jintao Yu on 2025/6/21.
//

import Foundation
import SwiftUI

enum Level: String, Equatable, CaseIterable {
    case Level
    case Easy
    case Middle
    case Hard
    
    // for display in the drop down box
    var localizedName: LocalizedStringKey {LocalizedStringKey(rawValue)}
}

enum Mat: String, Equatable, CaseIterable {
    case Material
    case Video
    case Book
    case Coding
    
    // for display in the drop down box
    var localizedName: LocalizedStringKey {LocalizedStringKey(rawValue)}
}

struct Event {
    var id: Int
    var date: Date
    var title: String
    var level: Level
    var mat: Mat
    var state: Bool
}
