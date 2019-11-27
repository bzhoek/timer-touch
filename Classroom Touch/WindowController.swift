import Cocoa

@available(OSX 10.12.2, *)
class WindowController: NSWindowController, NSScrubberDataSource {
  @IBOutlet weak var tslider: NSSlider!
  @IBOutlet weak var tscrubber: NSScrubber!
  let sid = NSUserInterfaceItemIdentifier(rawValue: "TextScrubberItemIdentifier")
  override func windowDidLoad() {
    super.windowDidLoad()
    tslider.action = #selector(sliderChanged)
    tscrubber.dataSource = self
    tscrubber.register(NSScrubberTextItemView.self, forItemIdentifier: sid)
  }
  
  @objc func sliderChanged() {
    print(tslider.doubleValue)
  }
}

private typealias ScrubberDataSource = WindowController
@available(OSX 10.12.2, *)
extension ScrubberDataSource {
  func numberOfItems(for scrubber: NSScrubber) -> Int {
    100
  }
  
  func scrubber(_ scrubber: NSScrubber, viewForItemAt index: Int) -> NSScrubberItemView {
    let itemView = scrubber.makeItem(withIdentifier: sid, owner: self) as! NSScrubberTextItemView
      
    itemView.title = String(index)
    return itemView
  }
}
