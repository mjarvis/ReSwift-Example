//
//  CounterStateReducerTests.swift
//  ReSwift-ExampleTests
//
//  Created by Malcolm Jarvis on 2018-05-02.
//  Copyright © 2018 ReSwift. All rights reserved.
//

import XCTest
@testable import ReSwift_Example

final class CounterStateReducerTests: XCTestCase {
    
    func testIncrementCounter() {
        let initialState = CounterState(count: 0)
        let action = IncrementCounter()

        XCTAssertEqual(initialState.count, 0)

        let state = counterStateReducer(action, initialState)

        XCTAssertEqual(state.count, 1)
    }
    
}
