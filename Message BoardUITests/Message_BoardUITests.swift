//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest
@testable import Message_Board

class Message_BoardUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        app = XCUIApplication()
        
        // NOTE: Keep this setup as is for UI Testing
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    func testCreateNewThread() {
       
        createThreadTextField.tap()
        createThreadTextField.typeText("A New Thread")
        app.keyboards.buttons["Return"].tap()
        
        XCTAssertTrue(app.tables.staticTexts["A New Thread"].exists)
        
        createThreadTextField.tap()
        createThreadTextField.typeText("Something New Here")
        app.keyboards.buttons["Return"].tap()
        
        XCTAssertTrue(app.tables.staticTexts["Something New Here"].exists)
        
    }
    
    func testCreatedThreadCellGoesToDetailVC() {
        
        createThreadTextField.tap()
        createThreadTextField.typeText("A New Thread")
        app.keyboards.buttons["Return"].tap()
        app.tables.children(matching: .cell).element(boundBy: 0).staticTexts["A New Thread"].tap()
        
        XCTAssertTrue(app.navigationBars.staticTexts["A New Thread"].exists)
        
    }
    
    // Test that a Message can be added successfully
    func testAddButtonAddsMessage() {
        
        createThreadTextField.tap()
        createThreadTextField.typeText("A New Thread")
        app.keyboards.buttons["Return"].tap()
        app.tables.children(matching: .cell).element(boundBy: 0).staticTexts["A New Thread"].tap()
        
        app.navigationBars["A New Thread"].buttons["Add"].tap()
        app.textFields["Enter your name:"].tap()
        app.textFields["Enter your name:"].typeText("Brandi")
        app.textViews["Enter Message:"].tap()
        app.textViews["Enter Message:"].typeText("Yodel")
        app.navigationBars["New Message"].buttons["Send"].tap()
        
        XCTAssertTrue(app.tables.staticTexts["Yodel"].exists)
    }
    
    private var createThreadTextField: XCUIElement {
        return app.tables.textFields["Create a new thread:"]
    }
}
