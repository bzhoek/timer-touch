import Cocoa

class ViewController: NSViewController {
  
  @IBOutlet weak var wslider: NSSlider!
  @IBOutlet weak var wlable: NSTextField!
  
  var observer: NSKeyValueObservation?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    observer = UserDefaults.standard.observe(\.countDown, options: [.initial, .new], changeHandler: { (defaults, _) in
        print("v \(defaults.countDown)")
      self.wlable.attributedStringValue = timeAttributedString(percent: defaults.countDown)
    })
  }

}

