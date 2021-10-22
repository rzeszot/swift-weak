public struct Weak<T: AnyObject> {
  public private(set) weak var object: T?

  public init() {
  }

  public init(_ object: T) {
    self.object = object
  }
}

extension Weak: Equatable where T: Equatable {

}

extension Weak: Hashable where T: Hashable {

}
