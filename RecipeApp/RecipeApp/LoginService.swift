//
//  LoginService.swift
//  RecipeApp
//
//  Created by Sophie Clark on 23/05/2019.
//  Copyright © 2019 Sophie Clark. All rights reserved.
//

import Foundation
import RxSwift

struct LoginService {
    let url = URL(string: "https://recipeappapi-develop.vapor.cloud/api/users")!
//  let url = URL(string: "https://localhost:8080/login")!
  let client = HttpClient()
  func login(with email: String, password: String) -> Observable<UserAuthenticated> {
    let loginUrl = url.appendingPathComponent("/login")
    return client.request(type: .post, url: loginUrl, object: Credentials(username: email, password: password), headers: ["content-type":"application/json"])
  }
  
  func getUserDetails(with authenticatedUser: UserAuthenticated) -> Observable<User> {
    let urlWithID = url.appendingPathComponent("/\(authenticatedUser.userID)")
    return client.request(type: .get, url: urlWithID, headers: ["Authorization": authenticatedUser.token])
  }
}

struct Credentials: Codable {
  var username: String
  var password: String
}
