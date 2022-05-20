//
//  CollectionViewCell.swift
//
//  Created by Nelson Aquino Jr  on 5/17/22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    //MARK: - IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //MARK: - Cell Configuration
    public func configure(with meal: MealsModel.MealDetails, and image: UIImage) {
        imageView.image = image
        titleLabel.text = meal.strMeal
    }

}
