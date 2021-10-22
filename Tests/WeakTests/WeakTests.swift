// swiftlint:disable identifier_name

import Weak
import XCTest

final class WeakTests: XCTestCase {

  func test_dealloc_if_no_strong_reference() {
    let sut = Weak(SomeObject(1))

    XCTAssertNil(sut.object)
  }

  func test_dealloc_if_strong_reference() {
    let object = SomeObject(2)
    let sut = Weak(object)

    XCTAssertNotNil(sut.object)
  }

  func test_object_identifier_is_the_same() {
    let object = SomeObject(3)
    let sut = Weak(object)

    XCTAssertEqual(ObjectIdentifier(object), ObjectIdentifier(sut.object!))
  }

  func test_dealloc_when_ref_count_zeroes() {
    var object: SomeObject? = SomeObject(4)
    let sut = Weak(object!)

    XCTAssertNotNil(sut.object)
    object = nil
    XCTAssertNil(sut.object)
  }

  // MARK: - Equatable

  func test_equal() {
    let a = SomeObject(5)
    let b = SomeObject(5)

    XCTAssertEqual(Weak(a), Weak(b))
  }

  func test_not_equal_objects() {
    let a = SomeObject(6)
    let b = SomeObject(7)

    XCTAssertNotEqual(Weak(a), Weak(b))
  }

  func test_not_equal_nil() {
    let a = SomeObject(8)

    XCTAssertNotEqual(Weak(a), Weak<SomeObject>())
  }

  // MARK: - Hashable

  func test_hash_into() {
    var sut = Hasher()
    let object = SomeObject(9)
    let weakObject = Weak(object)
    weakObject.hash(into: &sut)

    var ref = Hasher()
    Optional(9).hash(into: &ref)

    XCTAssertEqual(sut.finalize(), ref.finalize())
  }

}
