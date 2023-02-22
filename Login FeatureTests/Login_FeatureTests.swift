//
//  Login_FeatureTests.swift
//  Login FeatureTests
//
//  Created by ousmane diouf on 2/18/23.
//

import XCTest
import Alchemy

@testable import Login_Feature

final class Login_FeatureTests: XCTestCase {

    var handler: AuthLayer?

    override func setUpWithError() throws {
        try super.setUpWithError()
        self.handler = AuthLayer()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        self.handler =  nil    }

    func testAuthenticationPassed() { }
    
    func testAuthenticationFailed() { }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
