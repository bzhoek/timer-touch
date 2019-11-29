import XCTest

class Classroom_TouchTests: XCTestCase {

  func secondsr(_ percent: Int, _ ranges: [(Range<Int>, Int)]) -> Int {
    if let t = ranges.first {
      let delta = min(t.0.upperBound - t.0.lowerBound, percent * t.1)
      return delta + secondsr(percent - delta / t.1, Array(ranges.dropFirst()))
    }
    return 0
  }

  func testRecursive() {
    let ranges = [
      (0..<(1 * 60), 5),
      ((1 * 60)..<(3 * 60), 10),
      ((3 * 60)..<(10 * 60), 30),
      ((10 * 60)..<(30 * 60), 60),
      ((30 * 60)..<(180 * 60), 60 * 5),
      ((180 * 60)..<(500 * 60), 60 * 10),
    ]
    XCTAssertEqual(secondsr(6, ranges), 30)
    XCTAssertEqual(secondsr(13, ranges), 70)
    XCTAssertEqual(secondsr(25, ranges), 210)
    XCTAssertEqual(secondsr(39, ranges), 11 * 60)
    XCTAssertEqual(secondsr(59, ranges), 35 * 60)
    XCTAssertEqual(secondsr(89, ranges), 190 * 60)
    XCTAssertEqual(secondsr(100, ranges), 5 * 60 * 60)
  }

  func seconds(_ percent: Int) -> Int {
    let ranges = [
      (0..<(1 * 60), 5),
      ((1 * 60)..<(3 * 60), 10),
      ((3 * 60)..<(10 * 60), 30),
      ((10 * 60)..<(30 * 60), 60),
      ((30 * 60)..<(180 * 60), 60 * 5),
      ((180 * 60)..<(500 * 60), 60 * 10),
    ]
    var seconds = 0
    var remainder = percent
    ranges.forEach { (t) in
      let delta = min(t.0.upperBound - t.0.lowerBound, remainder * t.1)
      remainder -= delta / t.1
      seconds += delta
    }
    return seconds
  }

  func testLooped() {
    XCTAssertEqual(seconds(6), 30)
    XCTAssertEqual(seconds(13), 70)
    XCTAssertEqual(seconds(25), 210)
    XCTAssertEqual(seconds(39), 11 * 60)
    XCTAssertEqual(seconds(59), 35 * 60)
    XCTAssertEqual(seconds(89), 190 * 60)
    XCTAssertEqual(seconds(100), 5 * 60 * 60)
  }

}
