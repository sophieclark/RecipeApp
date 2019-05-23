//
//  User.swift
//  RecipeApp
//
//  Created by Sophie Clark on 23/05/2019.
//  Copyright © 2019 Sophie Clark. All rights reserved.
//

import Foundation

final class UserAuthenticated: Codable {
    var id: String
    var token: String
    var userID: String
    
    init(id: String, token: String, userID: String) {
      self.id = id
      self.token = token
      self.userID = userID
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
