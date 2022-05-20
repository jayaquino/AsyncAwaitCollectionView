# AsyncAwaitCollectionView

<p float="left">
  <img src = "https://user-images.githubusercontent.com/46248987/169466012-24b67b78-37e6-44de-9fd6-21fd1b0b6a79.png" width="250" >
  <img src = "https://user-images.githubusercontent.com/46248987/169466132-002e1503-a10d-4d56-8253-54b20975d597.png" width="250" >
  
</p>


## Description
* A basic app that fetches image and JSON data from The Meal DB.
* Async Await
* Collection View
* Table View (UIListContentConfiguration)
* MVVM Design Pattern

## Frameworks
* UIKit

# What I Learned
* Configuring a Collection View with custom cells.
* Using async await instead of Dispatch Group. Async await is another way to handle asynchronous calls without the use of @escaping or implementing the delegate protocol pattern. Can avoid nested asynchronous calls since await methods in Task suspends further code execution until it returns a result; allows neatly writing concurrent code.
* Using async sequence to iterate through a limited amount of asynchronous calls. Using this approach suspends code in each element.
* Dealing with values that come up nil in an API call.
