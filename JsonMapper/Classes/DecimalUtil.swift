//
//  Any+Extensions.swift
//  Pods
//
//  Created by Thomas Lextrait (Personal) on 1/19/17.
//
//

import UIKit

open class DecimalUtil {
    
    open static func isDecimal(obj: Any?) -> Bool {
        if obj == nil {
            return false
        }
        
        return obj is Double ||
            obj is Float ||
            obj is Float32 ||
            obj is Float64 ||
            obj is Float80
    }
    
    open static func decimalToInteger<T: SignedInteger>(obj: Any?) -> T? {
        var int: T?
        
        if isDecimal(obj: obj), let double = obj as? Double {
            int = round(double) as? T
            return int
        }
        
        return int
    }
    
}
