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
  let userAuthenticatedRepo = UserAuthenticatedRepository()
  
  func login(with email: String, password: String) -> Observable<UserAuthenticated> {
    return loginService.login(with: email, password: password).observeOn(MainScheduler.instance).do(onNext: { (authenticatedUser) in
      self.userAuthenticatedRepo.saveUserAuthentication(authenticatedUser)
    })
  
  }
  
  func getUserDetails(for authenticatedUser: UserAuthenticated) -> Observable<User> {
    return loginService.getUserDetails(with: authenticatedUser)
  }
  
  func pushToRecipeFeed(in navigationController: UINavigationController?) {
    guard let navigationController = navigationController else {
      return
    }
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let vc = storyboard.instantiateViewController(withIdentifier: RecipeFeedTableViewController.identifier) as! RecipeFeedTableViewController
    vc.viewModel = RecipeFeedViewModel()
    navigationController.pushViewController(vc, animated: true)
  }
}
