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
        return state ?? AppState()
    }
}
