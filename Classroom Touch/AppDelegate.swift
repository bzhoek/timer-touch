import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

  func applicationDidFinishLaunching(_ aNotification: Notification) {
    // Insert code here to initialize your application
  }

  func applicationWillTerminate(_ aNotification: Notification) {
    // Insert code here to tear down your application
  }

}

extension UserDefaults {
  @objc dynamic var countDown: Float {
    get {
        return float(forKey: "countDown")
    }
    set {
        set(newValue, forKey: "countDown")
    }
  }
}

func percentToTimeString(doubleValue: Double) -> String {
  let value = round(doubleValue)
  switch value {
  case ..<12:
    return String(format: "0:00:%02d", Int(value) * 5)
  case ..<24:
    let seconds = (Int(value)-6) * 10
    return String(format: "0:%02d:%02d", seconds / 60, seconds % 60)
  case ..<39:
    let seconds = (Int(value)-18) * 30
    return String(format: "0:%02d:%02d", seconds / 60, seconds % 60)
  case ..<58:
    let seconds = (Int(value)-28) * 60
    return String(format: "0:%d:%02d", seconds / 60, seconds % 60)
  case ..<88:
    let seconds = (Int(value)-52) * 60 * 5
    let minutes = Int(seconds / 60)
    return String(format: "%01d:%02d:%02d", minutes / 60, minutes % 60, seconds % 60)
  default:
    let seconds = (Int(value)-70) * 60 * 10
    let minutes = Int(seconds / 60)
    return String(format: "%01d:%02d:%02d", minutes / 60, minutes % 60, seconds % 60)
  }
}

