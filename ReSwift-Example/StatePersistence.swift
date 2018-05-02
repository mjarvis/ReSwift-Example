//
//  StatePersistence.swift
//  ReSwift-Example
//
//  Created by Malcolm Jarvis on 2018-05-02.
//  Copyright © 2018 ReSwift. All rights reserved.
//

import Foundation
import ReSwift

struct StatePersistence<S: Codable> {
    static var file: URL { return NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("state")! }

    struct Restore: Action {
        let state: S
    }

    struct Error: Action, RecordableError {
        let error: Swift.Error
    }

    static func restore() -> Action {
        do {
            let data = try Data(contentsOf: file)
            let decoder = JSONDecoder()
            let state = try decoder.decode(S.self, from: data)
            return Restore(state: state)
        } catch {
            return Error(error: error)
        }
    }

    static func middleware() -> Middleware<S> {
        return { dispatch, getState in
            return { next in
                return { action in
                    next(action)

                    guard let state = getState(), !(action is ReSwiftInit) else {
                        return
                    }

                    let encoder = JSONEncoder()
                    do {
                        let data = try encoder.encode(state)
                        try data.write(to: file)
                    } catch {
                        let error = Error(error: error)
                        dispatch(error)
                    }
                }
            }
        }
    }
}
