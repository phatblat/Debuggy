//
//  Bundle.swift
//  Debuggy
//
//  Created by Ben Chatelain on 2/3/20.
//

import UIKit
import Foundation

extension Bundle {

    /// Returns the Debuggy library resources bundle
    class func resources(for libType: Any) -> Bundle {

        // Need a class type defined in the library
        guard let metaType = type(of: libType) as? AnyClass else {
            fatalError("Please pass a class type to Bundle.resources(for:) \(libType)")
        }

        // Framework bundle
        let libBundle = Bundle(for: metaType)
        let resources = libBundle.path(forResource: "Debuggy", ofType: "bundle")!

        guard let resBundle = Bundle(path: resources) else {
            fatalError("Unable to find framework resource bundle: \(resources)")
        }

        return resBundle
    }
}
