//
//  TypedName.swift
//  wt_code_challenge
//
//  Created by Pablo Reyes on 1/11/21.
//

import Foundation

protocol TypedName: AnyObject {
    static var typedName: String { get }
}

// Swift Objects
extension TypedName {
    static var typedName: String {
        let type = String(describing: self)
        return type
    }
}

// Bridge to Obj-C
extension NSObject: TypedName {
    class var typedName: String {
        let type = String(describing: self)
        return type
    }
}
