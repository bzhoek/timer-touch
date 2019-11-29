import Cocoa

class SwipeView: NSView {
  override func scrollWheel(with event: NSEvent) {
    let changed = UserDefaults.standard.countDown - Float(event.deltaX)
    UserDefaults.standard.countDown = max(0, changed)
  }
}
