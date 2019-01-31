import XCTest
@testable import PredicateKit

final class PredicateKitTests: XCTestCase {
    
    func testContains() {
        let t = Key<String>("title")
          XCTAssertEqual(t.contains("content"), NSPredicate(format: "title CONTAINS %@", argumentArray: ["content"]))
    }
    
    func testBetwwen() {
        let date = Key<Date>("date")
        let now = Date()
        XCTAssertEqual(date.between(now, now), NSPredicate(format: "date BETWEEN {%@, %@}", argumentArray: [now, now]))
    }
    
    func testOptional() {
        let id = Key<String>("id")
        XCTAssertEqual(id == nil, NSPredicate(format: "id == nil"))
    }
    
    func testEqual() {
        let age = Key<Bool>("age")
        XCTAssertEqual(age == true, NSPredicate(format: "age == true"))
    }
    
    func testNotEqual() {
        let age = Key<Int>("age")
        XCTAssertEqual(age != 18, NSPredicate(format: "age != 18"))
    }

    func testMorethan() {
        let age = Key<Int>("age")
        let a = age > 18
        XCTAssertEqual(a, NSPredicate(format: "age > 18"))
    }
    
    func testLessthan() {
        let age = Key<Int>("age")
        let a = age < 18
        XCTAssertEqual(a, NSPredicate(format: "age < 18"))
    }
    
    func testMorethan1() {
        let age = Key<Int>("age")
        let a = age >= 18
        XCTAssertEqual(a, NSPredicate(format: "age >= 18"))
    }
    
    func testLessthan2() {
        let age = Key<Int>("age")
        let a = age <= 18
        XCTAssertEqual(a, NSPredicate(format: "age <= 18"))
    }
}
