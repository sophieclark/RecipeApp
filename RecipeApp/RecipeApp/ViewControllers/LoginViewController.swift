//
//  ViewController.swift
//  RecipeApp
//
//  Created by Sophie Clark on 23/05/2019.
//  Copyright © 2019 Sophie Clark. All rights reserved.
//

import UIKit
import RxSwift

class LoginViewController: UIViewController {
  
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var errorLabel: UILabel!
  
  @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
  var viewModel = LoginViewModel()
  var disposeBag = DisposeBag()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    errorLabel.text = ""
    loadingIndicator.isHidden = true
    // Do any additional setup after loading the view.
  }
  
  
  @IBAction func loginPressed(_ sender: Any) {
    loadingIndicator.isHidden = false
    
    guard let email = emailTextField.text, let password = passwordTextField.text else {
      errorLabel.text = "Must enter email and password"
      return
    }
    viewModel.login(with: email, password: password).observeOn(MainScheduler.instance).flatMap({ (authenticatedUser) in
      self.viewModel.getUserDetails(for: authenticatedUser)
    }).subscribe(onNext: { (user) in
      self.loadingIndicator.isHidden = true
      print(user.emailAddress)
      print(user.firstname)
      self.viewModel.pushToRecipeFeed(in: self.navigationController)
    }, onError: { (error) in
      self.loadingIndicator.isHidden = true
      self.errorLabel.text = error.localizedDescription
    }).disposed(by: disposeBag)
  }
}

