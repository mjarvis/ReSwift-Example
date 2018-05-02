//
//  LoggingMiddleware.swift
//  ReSwift-Example
//
//  Created by Malcolm Jarvis on 2018-05-02.
//  Copyright © 2018 ReSwift. All rights reserved.
//

import Foundation
import ReSwift

func loggingMiddleware<S: StateType>() -> Middleware<S> {
    return { _, _ in
        return { next in
            return { action in
                dump(action)
                next(action)
            }
        }
    }
}
