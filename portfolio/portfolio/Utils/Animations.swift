import SwiftUI

//--------------[ MENU ]--------------
// --- Animation for Menu Elements || Transitory ---
extension AnyTransition {
    static var moveAndFade: AnyTransition {
        AnyTransition.asymmetric(
            insertion: .move(edge: .leading).combined(with: .opacity),
            removal: .move(edge: .leading).combined(with: .opacity)
        )
    }
}

// -- smooth scaling effect ---
extension Animation {
    static func scaleEffectHover(duration: Double = 0.4) -> Animation {
        return Animation.easeInOut(duration: duration)
    }
}

// --- Hambuger Menu -> X rotation ---
extension Animation {
    static func rotateHamburger(duration: Double = 0.3) -> Animation {
        return Animation.easeInOut(duration: duration)
    }
}

// --- Pulsating Menu Icon ---
extension Animation {
    static func pulseEffect(duration: Double = 1.0) -> Animation {
        return Animation.easeInOut(duration: duration)
            .repeatForever(autoreverses: true)
    }
}
