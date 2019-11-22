import Cocoa

class WindowController: NSWindowController {
  
  @IBOutlet weak var tslider: NSSlider!

  override func windowDidLoad() {
    super.windowDidLoad()
    tslider.action = #selector(sliderChanged)
  }
  
  @objc func sliderChanged() {
    print(tslider.doubleValue)
    if let viewController = self.contentViewController as? ViewController {
      DispatchQueue.main.async() {
        viewController.wslider.doubleValue = self.tslider.doubleValue
      }
    }
  }
  
}
