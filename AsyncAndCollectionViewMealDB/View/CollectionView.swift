//
//  ViewController.swift
//
//  Created by Nelson Aquino Jr  on 5/17/22.
//

import UIKit

class CollectionView: UICollectionViewController {

    //MARK: - Variables
    var viewModel : CollectionViewModel?
    var meals : [MealsModel.MealDetails]?
    var images : [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = CollectionViewModel()
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ReusableCell")
        
        Task {
            let mealsResult = await viewModel?.fetchMeals()
            switch mealsResult{
            case .success((let meals, let urls)):
                self.meals = meals
                for try await data in DataSequence(urls: urls) {
                    guard let image = UIImage(data: data) else { return }
                    images.append(image)
                    collectionView.reloadData()
                }
            case .failure(let error):
                print (error)
            case .none:
                print("error: no result")
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "DetailSegue", sender: indexPath)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ReusableCell", for: indexPath) as! CollectionViewCell
        
        if let meals = meals {
            cell.configure(with: meals[indexPath.row], and: images[indexPath.row])
        }
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailSegue" {
            if let viewModel = viewModel, let meals = meals {
                let sender = sender as! IndexPath
                let vc = segue.destination as! DetailViewController
                vc.image = images[sender.row]
                Task {
                    let result = await viewModel.fetchDessert(mealID: meals[sender.row].idMeal)
                    switch result {
                    case .success(let meal):
                        vc.meal = meal
                        vc.viewModel = DetailsViewModel(meal: meal[0])
                        vc.tableView.reloadData()
                    case .failure(let error):
                        vc.meal = nil
                        print(error)
                    }
                }
            }
        }
    }
}

