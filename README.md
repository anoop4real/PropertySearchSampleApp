
# PropertySearch


#### Objective

Write an application which could display a search result for properties for sale in Sweden


#### Tech Stack

1. XCode 14.2
2. Swift 5.7


Project is structured into 

- Modules : - This is where all the specific module or feature related code goes in.
- Core :- All shared/ core components goes in here. Themes, extensions, helpers etc
- Webservice - All API related components goes in here


Every module will have a
- `View/ ViewController / cells` :- Takes care of the UI/ UX
- `DataStore `:- Takes care of the business logic and presentation manipulations
- `Model`:- Any API datamodel as and when required.
- `ViewModel`:- Any datamodel designed to update UI with proper presentable values.

Views are created programmatically.

Basic App Flow:-

The landing page of the app is `PropertySearchViewController` which holds a tableview to list out the search results.
    `PropertySearchDataStore` handles all the business logic and making the UI view models with presentable data. `PropertySearchDataStore` takes in 
    a `NetworkDataManager` which is injected and initializer param and which is responsible for fetching the data. The list response contain
    heterogeneous data structure, so used an enum approach to resolve it so that results are parsed according to the `type` field. Then the
    response data is made presentable view models, which the tableview gets using the convenience functions from the dataStore.
    
The details page is handled by `PropertyDetailsViewController` which holds a tableview to list out the details of the property.
    `PropertyDetailsDataStore` handles all the business logic and making the UI view models with presentable data. To make the UI
    extensible, I took an approach to make a sectioned tableView where the entire data can be logically separated, so ended up in 
    making 3 sections, photo-address-price section, description section and attributes, this way you can keep the view extensible
    if more data is needed in future its easy to add. Have done basic unit tests.
    
Third party components
    Kingfisher:- https://github.com/onevcat/Kingfisher
    Lightweight image loading library, prefetching , caching etc.
    

##### Improvements

- Group certain areas of the App as swift packages ( ex: Theme ( AppColor/ Font etc, Network Layer))
- Making the dataStores ObjservedObject, there by bring in some power of combine and have ui respond to states of dataStore.
- Build UI in SwiftUI
- More unit tests

##### Assumptions Made
- Currency :SEK
- Living area unit : meter aquare m2
- A few of the properties without which UI doesnt make sense, were considered as required. (example: id, type, price, address etc)
