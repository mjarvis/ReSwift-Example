//
//  ErrorRecordingMiddleware.swift
//  ReSwift-Example
//
//  Created by Malcolm Jarvis on 2018-05-02.
//  Copyright © 2018 ReSwift. All rights reserved.
//

import Foundation
import ReSwift

protocol RecordableError {
    var error: Error { get }
}

struct GenericError: Action, RecordableError {
    let error: Error
}

extension String: Error {}

func errorRecorder(handler: @escaping (RecordableError) -> Void) -> Middleware<Any> {
    return { _, _ in
        return { next in
            return { action in
                if let error = action as? RecordableError {
                    handler(error)
                }
                next(action)
            }
        }
    }
}

#if DEBUG
// Used in error handler breakpoint
func logToConsole(error: RecordableError) {
    if let convertible = error as? CustomDebugStringConvertible {
        debugPrint(convertible)
    } else {
        dump(error.error)
    }
}
#endif
