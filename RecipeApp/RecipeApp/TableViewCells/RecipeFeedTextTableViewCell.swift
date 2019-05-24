//
//  RecipeFeedTextTableViewCell.swift
//  RecipeApp
//
//  Created by Sophie Clark on 24/05/2019.
//  Copyright © 2019 Sophie Clark. All rights reserved.
//

import UIKit

class RecipeFeedTextTableViewCell: UITableViewCell {
  
  @IBOutlet weak var recipeNameLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
  func setup(with recipe: Recipe) {
    recipeNameLabel.text = recipe.name
  }
  
}
