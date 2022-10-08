extension Color {
    static let neuBackground = Color(hex: "f0f0f3")
    static let dropShadow = Color(hex: "edf2f4")
    static let dropLight = Color(hex: "ffffff")
}

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        self.init(red: Double(r) / 0xff, green: Double(g) / 0xff, blue: Double(b) / 0xff)
    }
}


import PartialSheet
import SwiftUI
@main
struct Live_RatingsApp: App {

    var body: some Scene {
        WindowGroup {
            NavigationView {

                ContentView().attachPartialSheetToRoot()
            }.navigationViewStyle(StackNavigationViewStyle())
        }
    }
}
