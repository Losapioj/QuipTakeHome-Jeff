//
//  BaseTestCase.swift
//  QuipTakeHomeTests
//
//  Created by JEFFREY LOSAPIO on 1/19/22.
//

import XCTest

class BaseTestCase: XCTestCase {
    var hasLatestValueEmitted: Bool!
    let defaultTimeout: TimeInterval = 2
    
    override func setUpWithError() throws {
        hasLatestValueEmitted = false
    }
}
