//
//  CounterState.swift
//  ReSwift-Example
//
//  Created by Malcolm Jarvis on 2018-05-02.
//  Copyright © 2018 ReSwift. All rights reserved.
//

import Foundation
import ReSwift

struct CounterState: Equatable {
    var count: Int
}

protocol HasCounterState {
    var counterState: CounterState { get }
}

func counterStateReducer(_ action: Action, _ state: CounterState?) -> CounterState {
    var state = state ?? CounterState(count: 0)
    if action is IncrementCounter {
        state.count += 1
    }
    return state
}
