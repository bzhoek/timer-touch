//
//  Classroom_TouchTests.swift
//  Classroom TouchTests
//
//  Created by Bas van der Hoek on 29/11/2019.
//  Copyright © 2019 Zilverline. All rights reserved.
//

import XCTest

class Classroom_TouchTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func secondser(_ percent: Int) -> Int {
      let ranges = [
               (0..<(1*60),   5),
          ((1*60)..<(3*60),   10),
          ((3*60)..<(10*60),  30),
         ((10*60)..<(30*60),  60),
         ((30*60)..<(180*60), 60 * 5),
        ((180*60)..<(500*60), 60 * 10),
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
  
    func testExample() {
      XCTAssertEqual(secondser(6), 30)
      XCTAssertEqual(secondser(13), 70)
      XCTAssertEqual(secondser(25), 210)
      XCTAssertEqual(secondser(39), 11 * 60)
      XCTAssertEqual(secondser(59), 35 * 60)
      XCTAssertEqual(secondser(89), 190 * 60)
      XCTAssertEqual(secondser(100), 5 * 60 * 60)
    }


}
