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
  
  var viewModel = LoginViewModel()
  var disposeBag = DisposeBag()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    emailTextField.text = ""
    // Do any additional setup after loading the view.
  }
  
  
  @IBAction func loginPressed(_ sender: Any) {
    guard let email = emailTextField.text, let password = passwordTextField.text else {
      errorLabel.text = "Must enter email and password"
      return
    }
    viewModel.login(with: email, password: password).observeOn(MainScheduler.instance).subscribe(onNext: { (user) in
      print(user.emailAddress)
      print(user.firstname)
    }, onError: { (error) in
      self.errorLabel.text = error.localizedDescription
    }).disposed(by: disposeBag)
  }
}

