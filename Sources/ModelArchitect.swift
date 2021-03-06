
import Foundation
import SwiftyJSON

public struct ModelArchitect {

  public static let keys = [
    "id",
    "name",
    "url"
  ]

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let id = "id"
    static let name = "name"
    static let url = "url"
  }

  // MARK: Properties
  public var id: String?
  public var name: String?
  public var url: String?

  // MARK: SwiftyJSON Initializers
  /// Initiates the instance based on the object.
  ///
  /// - parameter object: The object of either Dictionary or Array kind that was passed.
  /// - returns: An initialized instance of the class.
  public init(object: Any) {
    self.init(json: JSON(object))
  }

  /// Initiates the instance based on the JSON that was passed.
  ///
  /// - parameter json: JSON object from SwiftyJSON.
  public init(json: JSON) {
    id = json[SerializationKeys.id].string
    name = json[SerializationKeys.name].string
    url = json[SerializationKeys.url].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = url { dictionary[SerializationKeys.url] = value }
    return dictionary
  }

}

// conform to Identifiable
extension ModelArchitect: Identifiable {
  public var identifier: Identifier {
    get { return self.id! }
    set { self.id = newValue }
  }
}

extension ModelArchitect: Equatable {
  static public func ==(lhs: ModelArchitect, rhs:ModelArchitect) -> Bool {
    return lhs.identifier == rhs.identifier
  }
}
