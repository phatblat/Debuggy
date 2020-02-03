//
//  UIViewController.swift
//  OpenLink
//
//  Created by Vince Davis on 4/1/19.
//  Copyright © 2019 Milwaukee Tool. All rights reserved.
//

import UIKit
import Foundation

/// Extensions to UIKit UIViewController class.
extension UIViewController {
    @objc func dismissModalAnimated() {
        dismiss(animated: true, completion: nil)
    }
}
