//
//  User.swift
//
//  Created by Matt Schmulen on 1/20/17
//  Copyright (c) __MyCompanyName__. All rights reserved.
//

import Foundation
import SwiftyJSON

public struct User {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let name = "name"
    static let avatarURL = "avatarURL"
    static let email = "email"
  }

  // MARK: Properties
  public var name: String?
  public var avatarURL: String?
  public var email: String?

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
    name = json[SerializationKeys.name].string
    avatarURL = json[SerializationKeys.avatarURL].string
    email = json[SerializationKeys.email].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = avatarURL { dictionary[SerializationKeys.avatarURL] = value }
    if let value = email { dictionary[SerializationKeys.email] = value }
    return dictionary
  }

}
