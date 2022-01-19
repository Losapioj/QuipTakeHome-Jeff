//
//  XCTest+Expect.swift
//  QuipTakeHomeTests
//
//  Created by JEFFREY LOSAPIO on 1/19/22.
//

import XCTest

extension XCTest {

    /**
     Function allows us to wait until the test value is true, which allows waiting for .debounce() on a publisher to finish
     - Parameter test: the value that must turn true to continue execution
     - Parameter timeout: alloted time to wait for the test to turn true, or fail
     - Parameter message: message displayed if test case fails due to timeout
     */
    func expectToEventually(_ test: @autoclosure () -> Bool, timeout: TimeInterval = 1.0, message: String = "") {
        let runLoop = RunLoop.current
        let timeoutDate = Date(timeIntervalSinceNow: timeout)
        repeat {
            if test() {
                return
            }
            runLoop.run(until: Date(timeIntervalSinceNow: 0.01))
        } while Date().compare(timeoutDate) == .orderedAscending
        
        XCTFail(message)
    }
    
    /**
     Function allows us to wait to make sure test condition does not turn false, allowing us to confirm that something does not change over a duration
     - Parameter test: the value that must remain true for the duration
     - Parameter for: time test must remain true
     - Parameter message: message displayed in the failure state if test changes to false before the duration ends
     */
    func expect(_ test: @autoclosure () -> Bool, for duration: TimeInterval = 0.4, message: String = "") {
        let runLoop = RunLoop.current
        let timeoutDate = Date(timeIntervalSinceNow: duration)
        repeat {
            if !test() {
                XCTFail(message)
                return
            }
            runLoop.run(until: Date(timeIntervalSinceNow: 0.01))
        } while Date().compare(timeoutDate) == .orderedAscending
    }
}
