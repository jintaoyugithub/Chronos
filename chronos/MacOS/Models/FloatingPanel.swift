//
//  FloatingPanel.swift
//  chronos
//
//  Created by Jintao Yu on 2025/6/21.
//

import SwiftUI

// for different view shared on floating panel
private struct FloatingPanelKey: EnvironmentKey {
    static let defaultValue: NSPanel? = nil
}

extension EnvironmentValues {
    var floatingPanel: NSPanel? {
        get { self[FloatingPanelKey.self] }
        set { self[FloatingPanelKey.self] = newValue }
    }
}

/// Allow we use one floating panel disply differ views
class FloatingPanel<Content: View>: NSPanel {
    private var curView: () -> Content
    
    init(view: @escaping () -> Content,
         contentRect: NSRect,
         backing: NSWindow.BackingStoreType = .buffered,
         defer flag:Bool = false
    ) {
        self.curView = view
        
        /// Init the window
        super.init(contentRect: contentRect,
                   styleMask: [.nonactivatingPanel, .titled, .resizable, .closable, .fullSizeContentView ],
                   backing: backing,
                   defer: flag)
        
        setUpWindow()
        setUpContentView()
    }
    
    /// Window Settings
    private func setUpWindow() {
        isFloatingPanel = true
        level = .floating
        titleVisibility = .hidden
        titlebarAppearsTransparent = true
        isMovableByWindowBackground = true
        hidesOnDeactivate = false
        // Make sure the floating panel is on top of all windows
        collectionBehavior = [
            .canJoinAllSpaces,
            .stationary
        ]
        // Hide all trafic light buttons
        standardWindowButton(.closeButton)?.isHidden = true
        standardWindowButton(.miniaturizeButton)?.isHidden = true
        standardWindowButton(.zoomButton)?.isHidden = true
        animationBehavior = .utilityWindow
    }
    
    /// Set the content view
    private func setUpContentView() {
        let hostView = NSHostingView(rootView: self.curView()
            .ignoresSafeArea()
            .environment(\.floatingPanel, self))
        
        self.contentView = hostView
        
        // this funcs only work when self.content has been assigned
        hostView.layoutSubtreeIfNeeded()
        hostView.setFrameSize(hostView.fittingSize)
        
        // wrong place: self.contentView = hostView

        /// Adjust the size here
        if let screen = NSScreen.main {
            let padding: CGFloat = 0
            
            let screenFrame = screen.visibleFrame
            let xPos = screenFrame.maxX - hostView.frame.width - padding
            let yPos = screenFrame.minY + padding

            setFrameOrigin(NSPoint(x: xPos, y: yPos))
            setContentSize(hostView.frame.size)
        }
    }
    
    /// Close automatically when out of focus
    override func resignMain() {
        super.resignMain()
    }
    
    override func close() {
        super.close()
    }
    
    override var canBecomeKey: Bool {
        return true
    }
    
    override var canBecomeMain: Bool {
        return true
    }
}







