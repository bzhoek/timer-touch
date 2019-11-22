import Cocoa

class ViewController: NSViewController {
  
  @IBOutlet weak var wslider: NSSlider!

  override func viewDidLoad() {
    super.viewDidLoad()
    wslider.action = #selector(sliderChanged)
  }

  override var representedObject: Any? {
    didSet {
    // Update the view, if already loaded.
    }
  }

  @objc func sliderChanged() {
    print(wslider.doubleValue)
  }

}

