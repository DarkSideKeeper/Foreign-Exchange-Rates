//
//  ForeignExchangeRatesUITests.swift
//  ForeignExchangeRatesUITests
//
//  Created by Titipan Sakunwongsalee on 16/9/2562 BE.
//  Copyright © 2562 Titipan Sakunwongsalee. All rights reserved.
//

import XCTest
@testable import ForeignExchangeRates

class ForeignExchangeRatesUITests: XCTestCase {

    let app = XCUIApplication()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = true

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_ChangeLanguageTh() throws {
        let navigationBar = app.navigationBars["อัตราแลกเปลี่ยน"].otherElements.firstMatch
        if navigationBar.exists {
            XCTAssertEqual(navigationBar.label, "อัตราแลกเปลี่ยน")
        }
    }
    
    func test_ChangeLanguageEn() throws {
        let navigationBar = app.navigationBars["Exchange-Rates"].otherElements.firstMatch
        if navigationBar.exists {
            XCTAssertEqual(navigationBar.label, "Exchange-Rates")
        }
    }
}
