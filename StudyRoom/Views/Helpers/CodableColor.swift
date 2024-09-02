
import UIKit
import SwiftUI


extension Color {
    // swiftlint:disable:next large_tuple
    var components: (red: Double, green: Double, blue: Double, opacity: Double) {

        typealias NativeColor = UIColor

        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var opacity: CGFloat = 0

        var native = NativeColor(self)
        
        native.getRed(&red, green: &green, blue: &blue, alpha: &opacity)

        return (red, green, blue, opacity)
    }
}
