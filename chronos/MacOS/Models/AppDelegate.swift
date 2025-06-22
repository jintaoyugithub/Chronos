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
    var contentPanel:FloatingPanel<AnyView>? // = FloatingPanel(view: { AnyView(EmptyView()) } , contentRect: .zero)
    
    /// Init functions
    func applicationDidFinishLaunching(_ notification: Notification) {
        NSApp.setActivationPolicy(.accessory)
        
        // default panel
        contentPanel = FloatingPanel(view: { AnyView(MainView()) } , contentRect: .zero)
        
        handleHotKey()
    }
    
    func showFloatingPanel() {
        if let window = contentWindow {
            window.close()
            contentWindow = nil
        }
        
        contentWindow = contentPanel
        
        contentPanel?.makeKeyAndOrderFront(nil)
        contentPanel?.makeKey()
    }
    
    func dismissPanel() {
        contentPanel?.close()
    }
    
    private func handleHotKey() {
        hotkey = HotKey(key: .p, modifiers: [.command, .shift])
        hotkey?.keyDownHandler = {
            [weak self] in DispatchQueue.main.async {
                print("toggle panel")
                self?.contentPanel?.toggle()
                
                if(self?.contentPanel?.isShown() == true) {
                    self?.showFloatingPanel()
                } else {
                    self?.dismissPanel()
                }
            }
        }
    }
}
