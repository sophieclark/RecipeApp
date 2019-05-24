//
//  RecipeFeedImageTableViewCell.swift
//  RecipeApp
//
//  Created by Sophie Clark on 24/05/2019.
//  Copyright © 2019 Sophie Clark. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class RecipeFeedImageTableViewCell: UITableViewCell {

  @IBOutlet weak var recipeImageView: UIImageView!
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
    guard let imageData = recipe.photo else {
      return
    }
    let image = UIImage(data: imageData)
    recipeImageView.image = image
    recipeNameLabel.text = recipe.name
  }
  
}
