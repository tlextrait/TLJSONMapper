//
//  NumberExtensions.swift
//  Pods
//
//  Created by Thomas Lextrait (Personal) on 1/19/17.
//
//

// - MARK: Protocols

protocol FloatingType {}
extension Float32 : FloatingType {} // Same as Float
extension Float64 : FloatingType {} // Same as Double
extension Float80 : FloatingType {}
extension CGFloat : FloatingType {}

protocol IntegerType {}
extension Int : IntegerType {}
extension Int8 : IntegerType {}
extension Int16 : IntegerType {}
extension Int32 : IntegerType {}
extension Int64 : IntegerType {}
extension UInt : IntegerType {}
extension UInt8 : IntegerType {}
extension UInt16 : IntegerType {}
extension UInt32 : IntegerType {}
extension UInt64 : IntegerType {}

protocol Roundable : FloatingType {
    func toInteger<T: AnyIntegerInitializable>() -> T?
}

protocol AnyFloatInitializable : FloatingType {
    static func from(float: FloatingType?) -> Self?
}

protocol AnyIntegerInitializable : IntegerType {
    static func from(int: IntegerType?) -> Self?
}

// - MARK: Floating Types

extension Float32 : AnyFloatInitializable, Roundable {
    
    internal func toInteger<T : AnyIntegerInitializable>() -> T? {
        return T.from(int: Int64(rounded()))
    }

    static func from(float: FloatingType?) -> Float32? {
        if float is Float32 {
            return self.init(float as! Float32)
        }
        if float is Float64 {
            return self.init(float as! Float64)
        }
        if float is Float80 {
            return self.init(float as! Float80)
        }
        if float is CGFloat {
            return self.init(float as! CGFloat)
        }
        return nil
    }
    
}

extension Float64 : AnyFloatInitializable, Roundable {
    
    internal func toInteger<T : AnyIntegerInitializable>() -> T? {
        return T.from(int: Int64(rounded()))
    }
    
    static func from(float: FloatingType?) -> Float64? {
        if float is Float32 {
            return self.init(float as! Float32)
        }
        if float is Float64 {
            return self.init(float as! Float64)
        }
        if float is Float80 {
            return self.init(float as! Float80)
        }
        if float is CGFloat {
            return self.init(float as! CGFloat)
        }
        return nil
    }
    
}

extension Float80 : AnyFloatInitializable, Roundable {
    
    internal func toInteger<T : AnyIntegerInitializable>() -> T? {
        return T.from(int: Int64(rounded()))
    }
    
    static func from(float: FloatingType?) -> Float80? {
        if float is Float32 {
            return self.init(float as! Float32)
        }
        if float is Float64 {
            return self.init(float as! Float64)
        }
        if float is Float80 {
            return self.init(float as! Float80)
        }
        if float is CGFloat {
            return self.init(Float64(float as! CGFloat))
        }
        return nil
    }
    
}

extension CGFloat : AnyFloatInitializable, Roundable {
    
    internal func toInteger<T : AnyIntegerInitializable>() -> T? {
        return T.from(int: Int64(rounded()))
    }
    
    static func from(float: FloatingType?) -> CGFloat? {
        if float is Float32 {
            return self.init(float as! Float32)
        }
        if float is Float64 {
            return self.init(float as! Float64)
        }
        if float is Float80 {
            return self.init(float as! Float80)
        }
        if float is CGFloat {
            return self.init(float as! CGFloat)
        }
        return nil
    }
    
}

// - MARK: Integer Types

extension Int : AnyIntegerInitializable {
    static func from(int: IntegerType?) -> Int? {
        if int is Int {
            return self.init(int as! Int)
        }
        if int is Int8 {
            return self.init(int as! Int8)
        }
        if int is Int16 {
            return self.init(int as! Int16)
        }
        if int is Int32 {
            return self.init(int as! Int32)
        }
        if int is Int64 {
            return self.init(int as! Int64)
        }
        if int is UInt {
            return self.init(int as! UInt)
        }
        if int is UInt8 {
            return self.init(int as! UInt8)
        }
        if int is UInt16 {
            return self.init(int as! UInt16)
        }
        if int is UInt32 {
            return self.init(int as! UInt32)
        }
        if int is UInt64 {
            return self.init(int as! UInt64)
        }
        return nil
    }
}

extension Int8 : AnyIntegerInitializable {
    static func from(int: IntegerType?) -> Int8? {
        if int is Int {
            return self.init(int as! Int)
        }
        if int is Int8 {
            return self.init(int as! Int8)
        }
        if int is Int16 {
            return self.init(int as! Int16)
        }
        if int is Int32 {
            return self.init(int as! Int32)
        }
        if int is Int64 {
            return self.init(int as! Int64)
        }
        if int is UInt {
            return self.init(int as! UInt)
        }
        if int is UInt8 {
            return self.init(int as! UInt8)
        }
        if int is UInt16 {
            return self.init(int as! UInt16)
        }
        if int is UInt32 {
            return self.init(int as! UInt32)
        }
        if int is UInt64 {
            return self.init(int as! UInt64)
        }
        return nil
    }
}

extension Int16 : AnyIntegerInitializable {
    static func from(int: IntegerType?) -> Int16? {
        if int is Int {
            return self.init(int as! Int)
        }
        if int is Int8 {
            return self.init(int as! Int8)
        }
        if int is Int16 {
            return self.init(int as! Int16)
        }
        if int is Int32 {
            return self.init(int as! Int32)
        }
        if int is Int64 {
            return self.init(int as! Int64)
        }
        if int is UInt {
            return self.init(int as! UInt)
        }
        if int is UInt8 {
            return self.init(int as! UInt8)
        }
        if int is UInt16 {
            return self.init(int as! UInt16)
        }
        if int is UInt32 {
            return self.init(int as! UInt32)
        }
        if int is UInt64 {
            return self.init(int as! UInt64)
        }
        return nil
    }
}

extension Int32 : AnyIntegerInitializable {
    static func from(int: IntegerType?) -> Int32? {
        if int is Int {
            return self.init(int as! Int)
        }
        if int is Int8 {
            return self.init(int as! Int8)
        }
        if int is Int16 {
            return self.init(int as! Int16)
        }
        if int is Int32 {
            return self.init(int as! Int32)
        }
        if int is Int64 {
            return self.init(int as! Int64)
        }
        if int is UInt {
            return self.init(int as! UInt)
        }
        if int is UInt8 {
            return self.init(int as! UInt8)
        }
        if int is UInt16 {
            return self.init(int as! UInt16)
        }
        if int is UInt32 {
            return self.init(int as! UInt32)
        }
        if int is UInt64 {
            return self.init(int as! UInt64)
        }
        return nil
    }
}

extension Int64 : AnyIntegerInitializable {
    static func from(int: IntegerType?) -> Int64? {
        if int is Int {
            return self.init(int as! Int)
        }
        if int is Int8 {
            return self.init(int as! Int8)
        }
        if int is Int16 {
            return self.init(int as! Int16)
        }
        if int is Int32 {
            return self.init(int as! Int32)
        }
        if int is Int64 {
            return self.init(int as! Int64)
        }
        if int is UInt {
            return self.init(int as! UInt)
        }
        if int is UInt8 {
            return self.init(int as! UInt8)
        }
        if int is UInt16 {
            return self.init(int as! UInt16)
        }
        if int is UInt32 {
            return self.init(int as! UInt32)
        }
        if int is UInt64 {
            return self.init(int as! UInt64)
        }
        return nil
    }
}

extension UInt : AnyIntegerInitializable {
    static func from(int: IntegerType?) -> UInt? {
        if int is Int {
            return self.init(int as! Int)
        }
        if int is Int8 {
            return self.init(int as! Int8)
        }
        if int is Int16 {
            return self.init(int as! Int16)
        }
        if int is Int32 {
            return self.init(int as! Int32)
        }
        if int is Int64 {
            return self.init(int as! Int64)
        }
        if int is UInt {
            return self.init(int as! UInt)
        }
        if int is UInt8 {
            return self.init(int as! UInt8)
        }
        if int is UInt16 {
            return self.init(int as! UInt16)
        }
        if int is UInt32 {
            return self.init(int as! UInt32)
        }
        if int is UInt64 {
            return self.init(int as! UInt64)
        }
        return nil
    }
}

extension UInt8 : AnyIntegerInitializable {
    static func from(int: IntegerType?) -> UInt8? {
        if int is Int {
            return self.init(int as! Int)
        }
        if int is Int8 {
            return self.init(int as! Int8)
        }
        if int is Int16 {
            return self.init(int as! Int16)
        }
        if int is Int32 {
            return self.init(int as! Int32)
        }
        if int is Int64 {
            return self.init(int as! Int64)
        }
        if int is UInt {
            return self.init(int as! UInt)
        }
        if int is UInt8 {
            return self.init(int as! UInt8)
        }
        if int is UInt16 {
            return self.init(int as! UInt16)
        }
        if int is UInt32 {
            return self.init(int as! UInt32)
        }
        if int is UInt64 {
            return self.init(int as! UInt64)
        }
        return nil
    }
}

extension UInt16 : AnyIntegerInitializable {
    static func from(int: IntegerType?) -> UInt16? {
        if int is Int {
            return self.init(int as! Int)
        }
        if int is Int8 {
            return self.init(int as! Int8)
        }
        if int is Int16 {
            return self.init(int as! Int16)
        }
        if int is Int32 {
            return self.init(int as! Int32)
        }
        if int is Int64 {
            return self.init(int as! Int64)
        }
        if int is UInt {
            return self.init(int as! UInt)
        }
        if int is UInt8 {
            return self.init(int as! UInt8)
        }
        if int is UInt16 {
            return self.init(int as! UInt16)
        }
        if int is UInt32 {
            return self.init(int as! UInt32)
        }
        if int is UInt64 {
            return self.init(int as! UInt64)
        }
        return nil
    }
}

extension UInt32 : AnyIntegerInitializable {
    static func from(int: IntegerType?) -> UInt32? {
        if int is Int {
            return self.init(int as! Int)
        }
        if int is Int8 {
            return self.init(int as! Int8)
        }
        if int is Int16 {
            return self.init(int as! Int16)
        }
        if int is Int32 {
            return self.init(int as! Int32)
        }
        if int is Int64 {
            return self.init(int as! Int64)
        }
        if int is UInt {
            return self.init(int as! UInt)
        }
        if int is UInt8 {
            return self.init(int as! UInt8)
        }
        if int is UInt16 {
            return self.init(int as! UInt16)
        }
        if int is UInt32 {
            return self.init(int as! UInt32)
        }
        if int is UInt64 {
            return self.init(int as! UInt64)
        }
        return nil
    }
}

extension UInt64 : AnyIntegerInitializable {
    static func from(int: IntegerType?) -> UInt64? {
        if int is Int {
            return self.init(int as! Int)
        }
        if int is Int8 {
            return self.init(int as! Int8)
        }
        if int is Int16 {
            return self.init(int as! Int16)
        }
        if int is Int32 {
            return self.init(int as! Int32)
        }
        if int is Int64 {
            return self.init(int as! Int64)
        }
        if int is UInt {
            return self.init(int as! UInt)
        }
        if int is UInt8 {
            return self.init(int as! UInt8)
        }
        if int is UInt16 {
            return self.init(int as! UInt16)
        }
        if int is UInt32 {
            return self.init(int as! UInt32)
        }
        if int is UInt64 {
            return self.init(int as! UInt64)
        }
        return nil
    }
}
