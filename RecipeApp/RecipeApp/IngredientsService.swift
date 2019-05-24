//
//  RecipeService.swift
//  RecipeApp
//
//  Created by Sophie Clark on 24/05/2019.
//  Copyright © 2019 Sophie Clark. All rights reserved.
//

import Foundation
import RxSwift

struct IngredientsService {
  let url = URL(string: "https://recipeappapi-develop.vapor.cloud/api/ingredients")!
  //  let url = URL(string: "https://localhost:8080/login")!
  let client = HttpClient()
  
  func createingredients(with ingredients: [Ingredient], authenticatedUser: UserAuthenticated) -> Observable<[Ingredient]> {
    return client.request(type: .post, url: url, object: ingredients, headers: ["Authorization": authenticatedUser.token, "content-type":"application/json"])
  }
}
