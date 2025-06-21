//
//  CustomViewModifiers.swift
//  chronos
//
//  Created by Jintao Yu on 2025/6/21.
//

import SwiftUI

fileprivate struct FloatingPanelModifier<PanelContent: View>: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(10)
    }
}
