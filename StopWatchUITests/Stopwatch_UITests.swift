//
//  Stopwatch_UITests.swift
//  StopWatchUITests
//
//  Created by Ron Jurincie on 7/14/22.
//

import XCTest
@testable import StopWatch

class Stopwatch_UITests: XCTestCase {
    
    let app = XCUIApplication()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        

        XCTAssertTrue(app.exists)
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
    func test_StopWatchApp_MainView_secondsStaticText_shouldShow_13() {
        // Given
        let startButton = app.buttons["Start"]
        
        // When
        startButton.tap()
        sleep(13)
        startButton.tap()
                
        // Then
        let secondsOne = app.staticTexts["secondsOne"]
        let secondsTwo = app/*@START_MENU_TOKEN@*/.staticTexts["secondsTwo"]/*[[".staticTexts[\"8\"]",".staticTexts[\"secondsTwo\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertEqual(secondsOne.label, "1")
        XCTAssertEqual(secondsTwo.label, "3")
    }
    
    func test_StopWatchApp_MainView_startButton_shouldShowPAUSE () {
        // Given
        let startButton = app.buttons["Start"]
        
        // When
        startButton.tap()
        sleep(1)
        
        // Then
        XCTAssertEqual(startButton.label, "PAUSE")
    }
    
    func test_StopWatchApp_MainView_startButton_shouldShowSTART () {
        // Given
        let startButton = app.buttons["Start"]
        let resetButton = app.buttons["Reset"]
        
        // When
        startButton.tap()
        resetButton.tap()
        sleep(1)
        
        // Then
        XCTAssertEqual(startButton.label, "START")
    }
    
    func test_StopWatchApp_MainView_secondsStaticText_shouldShow_00() {
        // Given
        let startButton = app.buttons["Start"]
        let resetButton = app.buttons["Reset"]
        
        // When
        startButton.tap()
        sleep(5)
        resetButton.tap()
                
        // Then
        let secondsOne = app.staticTexts["secondsOne"]
        let secondsTwo = app/*@START_MENU_TOKEN@*/.staticTexts["secondsTwo"]/*[[".staticTexts[\"8\"]",".staticTexts[\"secondsTwo\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertEqual(secondsOne.label, "0")
        XCTAssertEqual(secondsTwo.label, "0")
    }
}

