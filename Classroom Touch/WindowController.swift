import Cocoa

@available(OSX 10.12.2, *)
class WindowController: NSWindowController {
  @IBOutlet weak var tslider: NSSlider!
  @IBOutlet weak var tbutton: NSButton!
  
  var observer: NSKeyValueObservation?
  
  override func windowDidLoad() {
    super.windowDidLoad()
    observer = UserDefaults.standard.observe(\.countDown, options: [.old, .new], changeHandler: { (defaults, _) in
      print("w \(defaults.countDown)")

      self.tbutton.title = timeAttributedString(percent: defaults.countDown).string
    })
  }

}
