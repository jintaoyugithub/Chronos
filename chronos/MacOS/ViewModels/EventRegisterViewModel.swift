//
//  EventRegisterViewModel.swift
//  chronos
//
//  Created by Jintao Yu on 2025/6/22.
//

import Foundation

class EventRegisterViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var level: Level = Level.Level
    @Published var mat: Mat = Mat.Material
    
    init() {}
    
    func registerEvent(title: String, level: Level, mat: Mat) {
        
    }
    
    func deleteEvent(event: Event) {
        
    }
}
