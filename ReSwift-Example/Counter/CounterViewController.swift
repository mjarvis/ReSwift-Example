//
//  CounterViewController.swift
//  ReSwift-Example
//
//  Created by Malcolm Jarvis on 2018-05-02.
//  Copyright © 2018 ReSwift. All rights reserved.
//

import UIKit
import ReSwift

final class CounterViewController<S: StoreType>: ViewController<S, CounterView> where S.State: HasCounterState {

    override func viewDidLoad() {
        super.viewDidLoad()

        customView.button.addTarget(self, action: #selector(incrementCounter), for: .touchUpInside)

        store.subscribe(self)
    }

    @objc private func incrementCounter() {
        let action = IncrementCounter()
        store.dispatch(action)
    }
}

extension CounterViewController: StoreSubscriber {
    func newState(state: S.State) {
        customView.label.text = "\(state.counterState.count)"
    }
}
