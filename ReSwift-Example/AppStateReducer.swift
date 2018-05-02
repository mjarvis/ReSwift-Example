//
//  AppStateReducer.swift
//  ReSwift-Example
//
//  Created by Malcolm Jarvis on 2018-05-02.
//  Copyright © 2018 ReSwift. All rights reserved.
//

import Foundation
import ReSwift

func appStateReducer() -> Reducer<AppState> {
    return { action, state in
        if let action = action as? StatePersistence<AppState>.Restore {
            return action.state
        } else {
            return AppState(
                counterState: counterStateReducer(action, state?.counterState)
            )
        }
    }
}
