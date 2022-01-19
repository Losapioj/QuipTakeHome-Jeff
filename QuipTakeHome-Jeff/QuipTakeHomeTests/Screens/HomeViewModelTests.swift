//
//  HomeViewModelTests.swift
//  QuipTakeHomeTests
//
//  Created by JEFFREY LOSAPIO on 1/17/22.
//

import XCTest
@testable import QuipTakeHome

class HomeViewModelTests: BaseTestCase {
    var subject: HomeViewModel!

    override func setUpWithError() throws {
        subject = HomeViewModel()
    }
    
    func test_onInit_ButtonIsDisabled() {
        XCTAssertEqual(subject.isButtonActive, false)
    }
    
    func test_ifDateIsChangedToBeforeToday_thenButtonIsEnabled() {
        let expectedResult = true
        var result: Bool?
        let disposable = subject.$isButtonActive.sink { isActive in
            result = isActive
            self.hasLatestValueEmitted = true
        }
        
        hasLatestValueEmitted = false
        
        let date = Date(timeIntervalSince1970: 0)
        subject.selectedDate = date
        
        expectToEventually(hasLatestValueEmitted)
        
        XCTAssertEqual(result, expectedResult)
        XCTAssertNotNil(disposable)
    }
    
    func test_ifDateIsChangedToAfterToday_thenButtonIsDisabled() {
        let expectedResult = false
        var result: Bool?
        let disposable = subject.$isButtonActive.sink { isActive in
            result = isActive
            self.hasLatestValueEmitted = true
        }
        
        hasLatestValueEmitted = false
        
        let dateBeforeNow = Date(timeIntervalSince1970: 0)
        subject.selectedDate = dateBeforeNow
        
        expectToEventually(hasLatestValueEmitted)
        hasLatestValueEmitted = false
        
        let dateAfterNow = Date(timeIntervalSinceNow: 1000000)
        subject.selectedDate = dateAfterNow
        
        expectToEventually(hasLatestValueEmitted)
        
        XCTAssertEqual(result, expectedResult)
        XCTAssertNotNil(disposable)
    }

}
