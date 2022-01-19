//
//  DayPhotosViewModelTests.swift
//  QuipTakeHomeTests
//
//  Created by JEFFREY LOSAPIO on 1/17/22.
//

import XCTest
@testable import QuipTakeHome

class DayPhotosViewModelTests: BaseTestCase {
    var selectedDate: Date!
    var subject: DayPhotosViewModel!

    override func setUpWithError() throws {
        
    }
    
    func setUpSubject() {
        subject = DayPhotosViewModel(selectedDate: selectedDate)
    }

    ///This example is to show how I would set up with initialization of data passed into the VM's init
    func test_onInit_photoArrayIsEmpty() throws {
        let expectedResult: [Photo] = []
        
        selectedDate = Date()
        setUpSubject()
        
        XCTAssertEqual(subject.photoArray, expectedResult)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
