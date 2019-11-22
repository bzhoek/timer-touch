import Cocoa

class WindowController: NSWindowController {
  
  @IBOutlet weak var tslider: NSSlider!

  override func windowDidLoad() {
    super.windowDidLoad()
    tslider.action = #selector(sliderChanged)
  }
  
  @objc func sliderChanged() {
    print(tslider.doubleValue)
  }
  
}
