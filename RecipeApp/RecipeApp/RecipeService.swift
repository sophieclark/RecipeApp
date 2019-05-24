//
//  RecipeService.swift
//  RecipeApp
//
//  Created by Sophie Clark on 24/05/2019.
//  Copyright © 2019 Sophie Clark. All rights reserved.
//

import Foundation
import RxSwift

struct RecipeService {
  let url = URL(string: "https://recipeappapi-develop.vapor.cloud/api/recipes")!
  //  let url = URL(string: "https://localhost:8080/login")!
  let client = HttpClient()
  func createRecipe(with recipe: Recipe, authenticatedUser: UserAuthenticated) -> Observable<Recipe> {
    return client.request(type: .post, url: url, object: recipe, headers: ["Authorization": authenticatedUser.token, "content-type":"application/json"])
  }
  
  func getRecipe(with recipeID: Int) -> Observable<Recipe> {
    let urlWithID = url.appendingPathComponent("/\(recipeID)")
    return client.request(type: .get, url: urlWithID, headers: [:])
  }
  
  func getRecipes() -> Observable<[Recipe]> {
    let urlWithPath = url.appendingPathComponent("/all")
    return client.request(type: .get, url: urlWithPath, headers: [:])
  }
}
