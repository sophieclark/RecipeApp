//
//  UserAuthenticationRepository.swift
//  RecipeApp
//
//  Created by Sophie Clark on 24/05/2019.
//  Copyright © 2019 Sophie Clark. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

final class UserAuthenticatedRepository {
  private var realm = try! Realm()
  
  func getUserAuthentication() -> UserAuthenticated? {
    return realm.objects(UserAuthenticated.self).last
  }
  
  func saveUserAuthentication(_ userAuthentication: UserAuthenticated) {
    try! realm.write {
      if let userOld = getUserAuthentication() {
        realm.delete(userOld)
      }
      realm.add(userAuthentication)
    }
  }
}
