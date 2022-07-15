//
//  StopWatchTests.swift
//  StopWatchTests
//
//  Created by Ron Jurincie on 7/14/22.
//

import XCTest
@testable import StopWatch

class StopWatchTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func test_MainViewModel_shouldNotBeNil () {
        // Given
        let mainVM = MainViewModel()
        
        // Then
        XCTAssertNotNil(mainVM)
    }
    
    func test_MainViewModel_hms_shouldInitializeToZero () {
        // Given
        let mainVM = MainViewModel()

        // When
        let hours = mainVM.hours
        let minutes = mainVM.minutes
        let seconds = mainVM.seconds

        // Then
        XCTAssertEqual(hours, 0)
        XCTAssertEqual(minutes, 0)
        XCTAssertEqual(seconds, 0)
    }
    
    func test_MainViewModel_setStaticText_settingSecondsTo_13_964_shouldShow_03Hours_52Minutes_44Seconds () {
        // Given
        let mainVM = MainViewModel()

        // When
        mainVM.secondsPassed = 13_964
        mainVM.setStaticText()
        
        // Then
        XCTAssertEqual(mainVM.hours, 3)
        XCTAssertEqual(mainVM.minutes, 52)
        XCTAssertEqual(mainVM.seconds, 44)
    }
    
    func test_MainViewModel_setStaticText_settingSecondsTo_360_000_shouldShow_0Hours_0Minutes_0Seconds () {
        // Given
        let mainVM = MainViewModel()

        // When
        mainVM.secondsPassed = 360_000
        mainVM.setStaticText()
        
        // Then
        XCTAssertEqual(mainVM.hours, 0)
        XCTAssertEqual(mainVM.minutes, 0)
        XCTAssertEqual(mainVM.seconds, 0)
    }
    
    func test_MainViewModel_setStaticText_settingSecondsTo_359_881_shouldShow_99Hours_58Minutes_01Seconds () {
        // Given
        let mainVM = MainViewModel()

        // When
        mainVM.secondsPassed = 359_881
        mainVM.setStaticText()
        
        // Then
        XCTAssertEqual(mainVM.hours, 99)
        XCTAssertEqual(mainVM.minutes, 58)
        XCTAssertEqual(mainVM.seconds, 01)
    }
}
