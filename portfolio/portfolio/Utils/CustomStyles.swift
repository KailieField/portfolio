import SwiftUI
import UIKit


// --- Component for aplpying glassmorphism frost ---

struct VisualEffectView: UIViewRepresentable {
    var blurStyle: UIBlurEffect.Style = .systemMaterialDark
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        let effectView = UIVisualEffectView(effect: UIBlurEffect(style: blurStyle))
        effectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return effectView
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        
    }
}

// --- UIKitVisualEffectView fallback for iOS 14 and below
struct UIKitVisualEffectView: UIViewRepresentable {
    var blurStyle: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: blurStyle))
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
}
