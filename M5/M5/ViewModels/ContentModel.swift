//
//  ContentModel.swift
//  M5
//
//  Created by ZhangTommy on 20/10/2022.
//

import Foundation

class ContentModel: ObservableObject {
    
    @Published var modules = [Module]()
    var styleData : Data?
    
    init() {
        getLocalData()
    }
    
    func getLocalData() {
        
        // Get a url to local json file
        let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        // Read the file
        do {
            // Try to decode the json

            let jsonData = try Data(contentsOf: jsonUrl!)
            let jsonDecoder = JSONDecoder()
            self.modules = try jsonDecoder.decode([Module].self, from: jsonData)
        } catch  {
            print(error)
            return
        }
        
        // Parse the style data
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        // Read the file
        do {
            // Try to decode the style
            self.styleData = try Data(contentsOf: styleUrl!)
            print("Style.html parsed")
        } catch  {
            print(error)
            return
        }

    }
}
