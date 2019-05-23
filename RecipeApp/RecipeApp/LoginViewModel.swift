//
//  LoginViewModel.swift
//  RecipeApp
//
//  Created by Sophie Clark on 23/05/2019.
//  Copyright © 2019 Sophie Clark. All rights reserved.
//

import Foundation
import RxSwift

final class LoginViewModel {
  let loginService = LoginService()
  let disposeBag = DisposeBag()
  
  func login(with email: String, password: String) -> Observable<User> {
    return loginService.login(with: email, password: password)
      .observeOn(MainScheduler.instance).flatMap({ authenticatedUser in
        return self.loginService.getUserDetails(with: authenticatedUser)
      })
  }
}
