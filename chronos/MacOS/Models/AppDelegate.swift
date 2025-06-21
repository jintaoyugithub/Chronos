//
//  AppDelegate.swift
//  chronos
//
//  Created by Jintao Yu on 2025/6/21.
//

import SwiftUI
import HotKey

class ChronosAppDelegate: NSObject, NSApplicationDelegate {
    var contentWindow: NSWindow?
    var hotkey: HotKey?
    
    /// Init functions
    func applicationDidFinishLaunching(_ notification: Notification) {
        NSApp.setActivationPolicy(.accessory)
        
        handleHotKey()
    }
    
    func showFloatingPanel() {
        if let window = contentWindow {
            window.close()
            contentWindow = nil
        }
        
        let contenPanel = FloatingPanel(view: { MainView() } , contentRect: .zero)
        
        contentWindow = contenPanel
        
        contenPanel.makeKeyAndOrderFront(nil)
        contenPanel.makeKey()
    }
    
    private func handleHotKey() {
        hotkey = HotKey(key: .p, modifiers: [.command, .shift])
        hotkey?.keyDownHandler = {
            [weak self] in DispatchQueue.main.async {
                self?.showFloatingPanel()
            }
        }
    }
}
