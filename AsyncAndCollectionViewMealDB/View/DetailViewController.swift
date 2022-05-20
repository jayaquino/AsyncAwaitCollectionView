//
//  DetailViewController.swift
//
//  Created by Nelson Aquino Jr  on 5/18/22.
//

import UIKit

class DetailViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Variables
    var viewModel : DetailsViewModel?
    var meal : [DessertModel.DessertDetails]?
    var image : UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
    
        guard let image = image else {return}
        imageView.image = image
    }
}

//MARK: - UITableViewDataSource
extension DetailViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        if let meal = meal {
            if indexPath.section == 0 {
                content.text = "What is this?"
                content.secondaryText = meal.first?.strMeal
            } else if indexPath.section == 1 {
                content.text = "How do you make it?"
                content.secondaryText = meal.first?.strInstructions
            } else if indexPath.section == 2 {
                content.text = "What do you use?"
                var ingredientsString = ""
                
                if let ingredients = viewModel?.ingredients {
                    for ingredient in ingredients {
                        ingredientsString += "\(ingredient.ingredient) : \(ingredient.measurement)\n"
                    }
                }
                content.secondaryText = ingredientsString
            }
            cell.contentConfiguration = content
        }
        return cell
    }
}

