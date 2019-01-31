import Foundation

public protocol KRKeyType {}
public protocol KRComparable {}
public protocol KREqualable {}
public protocol KRContainable {}

extension Int: KRKeyType, KRComparable, KREqualable {}
extension String: KRKeyType, KRComparable, KREqualable, KRContainable {}
extension Date: KRKeyType, KRComparable, KREqualable {}
extension Bool: KRKeyType, KREqualable {}

public struct Const<T: KRKeyType> {
    public var value: String
    init(_ value: String) {
        self.value = value
    }
}

public struct Key<T: KRKeyType> {
    public var path: String
    init(_ path: String) {
        self.path = path
    }
}

public func ><T>(lhs: Key<T>, rhs: Key<T>) -> NSPredicate where T: KRComparable {
    return NSPredicate(format: "\(lhs.path) > \(rhs.path)", argumentArray: nil)
}

public func ><T>(lhs: Key<T>, rhs: T) -> NSPredicate where T: KRComparable {
    return NSPredicate(format: "\(lhs.path) > %@", argumentArray: [rhs])
}

public func >=<T>(lhs: Key<T>, rhs: Key<T>) -> NSPredicate where T: KRComparable{
    return NSPredicate(format: "\(lhs.path) >= \(rhs.path)", argumentArray: nil)
}

public func >=<T>(lhs: Key<T>, rhs: T) -> NSPredicate where T: KRComparable {
    return NSPredicate(format: "\(lhs.path) >= %@", argumentArray: [rhs])
}

public func <<T>(lhs: Key<T>, rhs: Key<T>) -> NSPredicate where T: KRComparable {
    return NSPredicate(format: "\(lhs.path) < \(rhs.path)", argumentArray: nil)
}

public func <<T>(lhs: Key<T>, rhs: T) -> NSPredicate where T: KRComparable {
    return NSPredicate(format: "\(lhs.path) < %@", argumentArray: [rhs])
}

public func <=<T>(lhs: Key<T>, rhs: Key<T>) -> NSPredicate where T: KRComparable {
    return NSPredicate(format: "\(lhs.path) <= \(rhs.path)", argumentArray: nil)
}

public func <=<T>(lhs: Key<T>, rhs: T) -> NSPredicate where T: KRComparable {
    return NSPredicate(format: "\(lhs.path) <= %@", argumentArray: [rhs])
}


public func ==<T>(lhs: Key<T>, rhs: Key<T>) -> NSPredicate where T: KREqualable {
    return NSPredicate(format: "\(lhs.path) == \(rhs.path)", argumentArray: nil)
}

public func ==<T>(lhs: Key<T>, rhs: T) -> NSPredicate where T: KREqualable {
    return NSPredicate(format: "\(lhs.path) == %@", argumentArray: [rhs])
}

public func ==<T>(lhs: Key<T>, rhs: Optional<T>) -> NSPredicate where T: KREqualable {
    if let rhs = rhs {
        return NSPredicate(format: "\(lhs.path) == %@", argumentArray: [rhs])
    } else {
        return NSPredicate(format: "\(lhs.path) == nil")
    }
}

public func !=<T>(lhs: Key<T>, rhs: Key<T>) -> NSPredicate where T: KREqualable {
    return NSPredicate(format: "\(lhs.path) != \(rhs.path)", argumentArray: nil)
}

public func !=<T>(lhs: Key<T>, rhs: T) -> NSPredicate where T: KREqualable {
    return NSPredicate(format: "\(lhs.path) != %@", argumentArray: [rhs])
}

public func !=<T>(lhs: T, rhs: Key<T>) -> NSPredicate where T: KREqualable {
    return NSPredicate(format: "\(rhs.path) != %@", argumentArray: [lhs])
}

public func !=<T>(lhs: Key<T>, rhs: Optional<T>) -> NSPredicate where T: KREqualable {
    if let rhs = rhs {
        return NSPredicate(format: "\(lhs.path) != %@", argumentArray: [rhs])
    } else {
        return NSPredicate(format: "\(lhs.path) != nil")
    }
}

public extension Key where T: KRContainable {
    
    public func contains(_ t: T) -> NSPredicate {
        return NSPredicate(format: "\(self.path) CONTAINS %@", argumentArray: [t])
    }
    
}

public extension Key where T: KRComparable {
    
    public func between(_ lhs: T, _ hhs: T) -> NSPredicate {
        return NSPredicate(format: "\(self.path) BETWEEN { %@, %@ }", argumentArray: [lhs, hhs])
    }
    
}


