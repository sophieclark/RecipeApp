//
//  RecipeFeedViewModel.swift
//  RecipeApp
//
//  Created by Sophie Clark on 24/05/2019.
//  Copyright © 2019 Sophie Clark. All rights reserved.
//

import Foundation
import RxSwift

final class RecipeFeedViewModel {
  let recipeService = RecipeService()
  let disposeBag = DisposeBag()

  func getRecipes() -> Observable<[Recipe]> {
    return recipeService.getRecipes()
  }
  
  func getFullRecipe(with id: Int) -> Observable<Recipe> {
    return recipeService.getRecipe(with: id)
  }
}
