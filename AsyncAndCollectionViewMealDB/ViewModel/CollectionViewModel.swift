//
//  DetailViewModel.swift
//
//  Created by Nelson Aquino Jr  on 5/17/22.
//

import UIKit

class CollectionViewModel {
    
    //MARK: - ErrorList
    enum ErrorList : Error {
        case failedToFetchMeals
        case failedToFetchImages
        case failedToGetUrl
    }
    
    //MARK: - Functions
    public func fetchMeals() async -> Result<([MealsModel.MealDetails], [URL]), Error> {
        
        guard let url = URL(string:"https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert") else {return .failure(ErrorList.failedToGetUrl)}
        
        do {
            let (data,_) = try await URLSession.shared.data(from: url)
            let decodedResult = try JSONDecoder().decode(MealsModel.self, from: data)
            let meals = decodedResult.meals
            let urlString = meals.map { $0.strMealThumb }
            let urls : [URL] = urlString.map{ URL(string: $0)!}
            return .success((meals,urls))
            
        } catch {
            return .failure(ErrorList.failedToFetchMeals)
        }
    }
    
    public func fetchDessert(mealID : String) async -> Result<([DessertModel.DessertDetails]),Error> {
        
        guard let url = URL(string:"https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(mealID)") else {return .failure(ErrorList.failedToGetUrl)}
        
        do {
            let (data,_) = try await URLSession.shared.data(from: url)
            let decodedResult = try JSONDecoder().decode(DessertModel.self, from: data)
            let dessertDetails = decodedResult.meals
    
            return .success(dessertDetails)
            
        } catch {
            return .failure(ErrorList.failedToFetchMeals)
        }
        
    }
    
}

//MARK: - Async Sequence
struct DataSequence: AsyncSequence {
    typealias Element = Data
    
    let urls : [URL]
    init (urls: [URL]) {
        self.urls = urls
    }
    
    func makeAsyncIterator() -> DataIterator {
        return DataIterator(urls: urls)
    }
    
    struct DataIterator: AsyncIteratorProtocol {
        typealias Element = Data
        
        private var index = 0
        
        private let urlSession = URLSession.shared
        
        let urls : [URL]
        
        init (urls: [URL]) {
            self.urls = urls
        }
        
        mutating func next() async throws -> Data? {
            // check bounds of index
            guard index < urls.count else {
                return nil
            }
            // get url and increment index
            let url = urls[index]
            index += 1
            
            //perform api call
            let (data, _) = try await urlSession.data(from: url)
            
            //return data
            return data
        }
    }
}

