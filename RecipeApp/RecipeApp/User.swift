//
//  User.swift
//  RecipeApp
//
//  Created by Sophie Clark on 23/05/2019.
//  Copyright © 2019 Sophie Clark. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

final class UserAuthenticated: Object, Decodable  {
  @objc dynamic var id: String = UUID().uuidString
  @objc dynamic var token: String = ""
  @objc dynamic var userID: String = UUID().uuidString
  
  enum CodingKeys: CodingKey {
    case id, token, userID
  }
  
  override static func primaryKey() -> String? {
    return "id"
  }
  
  convenience init(id: UUID, token: String, userID: UUID) {
    self.init()
    self.id = id.uuidString
    self.token = token
    self.userID = userID.uuidString
  }
  
  convenience init(from decoder: Decoder) throws {
    self.init()
    let container = try decoder.container(keyedBy: CodingKeys.self)
    let idUUID = try container.decode(UUID.self, forKey: .id)
    id = idUUID.uuidString
    token = try container.decode(String.self, forKey: .token)
    let userIDUUID = try container.decode(UUID.self, forKey: .userID)
    userID = userIDUUID.uuidString
  }
  
  required init() {
    super.init()
  }
  
  required init(realm: RLMRealm, schema: RLMObjectSchema) {
    super.init(realm: realm, schema: schema)
  }
  
  required init(value: Any, schema: RLMSchema) {
    super.init(value: value, schema: schema)
  }
  
  
}

final class User: Codable {
  var id: UUID?
  var firstname: String
  var surname: String
  var emailAddress: String
  var username: String
  
  init(id: UUID?, firstname: String, surname: String, emailAddress: String, username: String) {
    self.id = id
    self.firstname = firstname
    self.surname = surname
    self.emailAddress = emailAddress
    self.username = username
  }
}
