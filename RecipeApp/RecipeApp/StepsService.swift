//
//  RecipeService.swift
//  RecipeApp
//
//  Created by Sophie Clark on 24/05/2019.
//  Copyright © 2019 Sophie Clark. All rights reserved.
//

import Foundation
import RxSwift

struct StepsService {
  let url = URL(string: "https://recipeappapi-develop.vapor.cloud/api/steps")!
  //  let url = URL(string: "https://localhost:8080/login")!
  let client = HttpClient()
  func createSteps(with steps: [Step], authenticatedUser: UserAuthenticated) -> Observable<[Step]> {
    return client.request(type: .post, url: url, object: steps, headers: ["Authorization": authenticatedUser.token, "content-type":"application/json"])
  }
}
