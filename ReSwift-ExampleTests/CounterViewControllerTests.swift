//
//  CounterViewControllerTests.swift
//  ReSwift-ExampleTests
//
//  Created by Malcolm Jarvis on 2018-05-02.
//  Copyright © 2018 ReSwift. All rights reserved.
//

import XCTest
@testable import ReSwift_Example
import ReSwift

final class CounterViewControllerTests: XCTestCase {

    struct MockState: StateType, HasCounterState {
        var counterState: CounterState = CounterState(count: 0)
    }

    var actionsDispatched: [Action] = []

    lazy var store = Store<MockState>(
        reducer: { [unowned self] in
            self.actionsDispatched.append($0)
            return $1 ?? MockState()
        },
        state: nil
    )

    lazy var controller = CounterViewController(store: store)

    override func setUp() {
        super.setUp()
        _ = controller // Force initial creation before tests
    }

    func testUpdatesLabel() {
        XCTAssertEqual(controller.customView.label.text, "0")
        store.state.counterState.count = 1
        XCTAssertEqual(controller.customView.label.text, "1")
    }

    func testDispatchesIncrementAction() {
        XCTAssertEqual(actionsDispatched.count, 1)

        controller.customView.button.sendActions(for: .touchUpInside)

        XCTAssertEqual(actionsDispatched.count, 2)

        if let action = actionsDispatched.last {
            XCTAssert(action is IncrementCounter)
        }
    }
}
