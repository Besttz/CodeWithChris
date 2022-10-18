//
//  ViewModel.swift
//  M4
//
//  Created by ZhangTommy on 19/10/2022.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var books = [Book]()
    init() {
        
        // Create an instance of data service and get the data
        self.books = DataService.getLocalData()
    }
}

class DataService {
    static func getLocalData() -> [Book] {
        
        // Parse local json file
        
        // Get a url path to the json file
        let pathString = Bundle.main.path(forResource: "Data", ofType: "json")
        
        // Check if pathString is not nil, otherwise...
        guard pathString != nil else {
            return [Book]()
        }
        
        // Create a url object
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            // Create a data object
            let data = try Data(contentsOf: url)
            
            // Decode the data with a JSON decoder
            let decoder = JSONDecoder()
            
            do {
                
                let recipeData = try decoder.decode([Book].self, from: data)
                
                // Return the recipes
                return recipeData
            }
            catch {
                // error with parsing json
                print(error)
            }
        }
        catch {
            // error with getting data
            print(error)
        }
        
        return [Book]()
    }
}
