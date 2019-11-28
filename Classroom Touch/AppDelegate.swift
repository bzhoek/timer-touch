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

func timeAttributedString(percent: Float) -> NSAttributedString {
  let value = round(percent)
  switch value {
  case ..<12:
    return greyed(String(format: "0:00:%02d", Int(value) * 5), 5)
  case ..<24:
    let seconds = (Int(value)-6) * 10
    return greyed(String(format: "0:%02d:%02d", seconds / 60, seconds % 60), 3)
  case ..<38:
    let seconds = (Int(value)-18) * 30
    return greyed(String(format: "0:%02d:%02d", seconds / 60, seconds % 60), 3)
  case ..<58:
    let seconds = (Int(value)-28) * 60
    return greyed(String(format: "0:%02d:%02d", seconds / 60, seconds % 60), 2)
  case ..<64:
    let seconds = (Int(value)-52) * 60 * 5
    let minutes = Int(seconds / 60)
    return greyed(String(format: "%01d:%02d:%02d", minutes / 60, minutes % 60, seconds % 60), 2)
  case ..<88:
    let seconds = (Int(value)-52) * 60 * 5
    let minutes = Int(seconds / 60)
    return greyed(String(format: "%01d:%02d:%02d", minutes / 60, minutes % 60, seconds % 60), 0)
  default:
    let seconds = (Int(value)-70) * 60 * 10
    let minutes = Int(seconds / 60)
    return greyed(String(format: "%01d:%02d:%02d", minutes / 60, minutes % 60, seconds % 60), 0)
  }
}

func greyed(_ original: String, _ count: Int) -> NSAttributedString {
  let str = NSMutableAttributedString(string: original)
  str.addAttribute(.foregroundColor, value: NSColor.gray, range: NSRange(location: 0, length: count))
  return str
}

