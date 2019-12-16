//
//  MessageThreadTests.swift
//  MessageBoardTests
//
//  Created by Andrew R Madsen on 9/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest
@testable import Message_Board

class MessageThreadTests: XCTestCase {
    
    var messageThreads: [MessageThread] = []
    
    // Test if fetched message thread dictionary is nil or not.
    
    func testFetchMessagesFromServer() {
        
        let baseURL = URL(string: "https://ios-testing-message-board.firebaseio.com/")!
        let requestURL = MessageThreadController.baseURL.appendingPathExtension("json")
               let decoder = JSONDecoder()
               
               URLSession.shared.dataTask(with: requestURL) { (data, _, error) in
                guard let data = data else {
                    NSLog("No data returned from data task")
                    return
                }
                   do {
                       self.messageThreads = Array(try decoder.decode([String: MessageThread].self, from: data).values)
                   } catch {
                       self.messageThreads = []
                       NSLog("Error decoding message threads from JSON data: \(error)")
                   }
               }
        XCTAssertNotNil(messageThreads)
    }
    
    // Cerated test to test creating a MessageThread with a title.  XCTAssertNoThrow() passes, XCTAssertThrowsError() fails, as no error was thrown.
    
    func testCreateMessageThread() {
        let title = "title"
        let createdMessageThread = MessageThread(title: title)
        
        XCTAssertNoThrow(createdMessageThread)
    }
    
    // Created test to test creating a Message with a sender and message text.  XCTAssertNoThrow() passes, XCTAssertThrowsError() fails, as no error was thrown.
    
    func testCreateMessage() {
        let sender = "Brandi"
        let text = "This is some message text"
        let createdMessage = MessageThread.Message(text: text, sender: sender)
        
        XCTAssertNoThrow(createdMessage)
    }
}
