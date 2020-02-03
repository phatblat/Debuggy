//
//  Bundle.swift
//  Debuggy
//
//  Created by Ben Chatelain on 2/3/20.
//

import UIKit
import Foundation

/// Extensions to foundation Bundle class.
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

    /// Retrieves a list of names of class in the bundle that implement DebugInstantiable.
    /// - Parameter classType: Type of class to search for.
    func retrieveAll<T: DebugInstantiable>(for classType: T.Type) -> [String] {
        guard let bundlePath = executablePath else {
            return []
        }

        var anyClasses: [String] = []
        var size: UInt32 = 0

        let classes = objc_copyClassNamesForImage(bundlePath, &size)

        for index in 0..<size {
            if let className = classes?[Int(index)],
                let name = NSString(utf8String: className) as String? {
                if NSClassFromString(name) is T.Type {
                    anyClasses.append(name)
                }
            }
        }

        return anyClasses
    }
}
