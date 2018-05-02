//
//  ViewController.swift
//  ReSwift-Example
//
//  Created by Malcolm Jarvis on 2018-05-02.
//  Copyright © 2018 ReSwift. All rights reserved.
//

import UIKit
import ReSwift

/// ViewController is a convenince class, that one may subclass to get ReSwift store
/// injection, as well as custom view class helpers.
///
/// Example usage:
/// ```
/// class LoginViewController<S: StoreType>: ViewController<S, LoginView> where S.State: HasLoginStuff {
///     override func viewDidLoad() {
///         super.viewDidLoad()
///         self.customView.submitButton.addTarget(...)
///     }
/// }
///
/// let controller = LoginViewController(store: self.store)
/// ```
public class ViewController<S: StoreType, View: UIView>: UIViewController {
    final let store: S

    final var customView: View {
        return self.view as! View
    }

    public init(store: S) {
        self.store = store
        super.init(nibName: nil, bundle: nil)
        self.configure()
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public final func loadView() {
        if View.self != UIView.self {
            self.view = View(
                frame: UIScreen.main.bounds)
        } else {
            super.loadView()
        }
    }

    /// Instead of overriding `init`, implement `configure` to do work such
    /// as setting `self.title` or other UIViewController properties.
    func configure() {}
}
