//
//  Recipe.swift
//  RecipeApp
//
//  Created by Sophie Clark on 24/05/2019.
//  Copyright © 2019 Sophie Clark. All rights reserved.
//

import Foundation

struct Recipe: Codable {
  var id: Int?
  var userID: String
  var name: String
  var photo: Data?
  var steps: [Step]?
  var ingredients: [Ingredient]?
  
  init(name: String, photo: Data?, userID: String) {
    self.name = name
    self.photo = photo
    self.userID = userID
  }
}

struct Step: Codable {
  var id: Int?
  var recipeID: Int
  var number: Int
  var instructions: String
  var photo: Data?
  
  init(id: Int?, recipeID: Int, number: Int, instructions: String, photo: Data?) {
    self.id = id
    self.recipeID = recipeID
    self.number = number
    self.instructions = instructions
    self.photo = photo
  }
}

struct Ingredient: Codable {
  var id: Int?
  var recipeID: Int
  var amount: Float
  var name: String
  var measurementType: MeasurementType
}

enum MeasurementType: String, Codable {
  case grams
  case kilograms
  case litres
  case mililetres
  case centiletres
  case ounce
  case pound
  case quantity
}
